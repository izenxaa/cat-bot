Discord = require('discord.js')
client = new Discord.Client

client.on 'ready', ->
  console.log "CatBot is now ready!"

client.on 'message', message = ->
  if message.content == 'ping'
    message.reply('Pong!')

client.login process.env.BOT_TOKEN
