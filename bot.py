import discord
from datetime import datetime
import os

client = discord.Client()
token = 'ODQzODMyMTk1NTk2MTU2OTcx.YKJl-Q.fw69GNgxUZYoai3z95emoQXDJKw' #enter your bot's token and it should be a string
channel_id = 843830145764818975 #enter your channel id and it should be a integer   

def time_module():
    print("time module in use")
    while True:
        current_time = datetime.now().strftime("%H:%M")#hour %H min %M sec %S am:pm %p 
        #print(current_time)
        if current_time == "19:34": # enter the time you wish 
            print("time module ended")
            break

time_module()

@client.event
async def on_ready():

    print("bot:user ready == {0.user}".format(client))
    channel = client.get_channel(channel_id)
    await channel.send("message")
    

client.run(token)