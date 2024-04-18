import discord
from discord.ext import commands, tasks
import subprocess
import asyncio

channel = 1230221396118868008
channel2 = 1230467965523066962
log_channel_id = 1230468506588418150
intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix='.', intents=intents)

async def run_local_commands(commands):
    try:
        process = await asyncio.create_subprocess_shell(commands, stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE)
        stdout, stderr = await process.communicate()
        stdout_str = stdout.decode().strip()
        stderr_str = stderr.decode().strip()
        print("Commands executed:", commands)
        print("Commands output:", stdout_str)
        if stderr_str:
            print("Commands error:", stderr_str)
        return stdout_str
    except Exception as e:
        print("Error executing commands:", e)
        return str(e)

@tasks.loop(seconds=60)  # Adjust interval as needed
async def ssh_keepalive():
    await run_local_commands("echo 'Keepalive'")

@ssh_keepalive.before_loop
async def before_ssh_keepalive():
    await bot.wait_until_ready()

@bot.command()
async def ssh(ctx, *, command):
    if ctx.channel.id != channel and ctx.channel.id != channel2:
        return
    if ctx.channel.id == channel or ctx.channel.id == channel2:
        output = await run_local_commands(command)
        await ctx.send(f'```{output}```')

@bot.event
async def on_ready():
    print("Bot is ready!")
    ssh_keepalive.start()

if __name__ == "__main__":
    token = input("Enter your bot token: ")
    bot.run(token)
