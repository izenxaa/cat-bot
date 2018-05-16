{ Discord } = require 'discord.js'
{ fs } = require 'fs'

client = new Discord.Client

# prefixes
prefix = ';'

# level handling

genUserLevel = (id, level, xp) ->
  levels = require 'json/levels.json'

  levels[id] =
    player_id: id
    player_level: level
    player_xp: xp

  fs.writeFile 'json/levels.json', JSON.stringify(levels), (err) ->
    console.log err

client.on 'ready', ->
  console.log "CatBot is now ready!"

client.on 'message', (message) ->
  if message.content == prefix + 'level'
    message.reply("This will be the level testing mechanism.")
  else if message.content == prefix + 'admingenlevel'
    try
      genUserLevel message.author.id, 1, 0
    catch error
      console.log 'ERROR occured. Not able to write to JSON file.'




client.login process.env.BOT_TOKEN
