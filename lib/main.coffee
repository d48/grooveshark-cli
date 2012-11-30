exec    = require('child_process').exec
# api  = require('../lib/api.coffee')
log     = console.log


# process command
execute = (cmd, cb) ->
  log "this is your command: #{cmd}"

  exec "#{cmd}", (err, stdout, stderr) ->
    if not err?
        log "successful execution of command: #{cmd}"
    else 
        log "there was an error: #{err}"
 
# available commands from cli
module.exports =
  play: ->
    execute 'play'

  startsession: ->
    log "these are args: #{@args}"

  help: ->
    log "help"

# var crypto = require('crypto')
#   , require('coffeescript')
#   , program = require('commander')
#   , secret  = '9e0004414522dafa6c9e466f940fde60'
#   // , key = 'secret'
#   , key = 'unix_design48'
#   , payload = "{'method': 'addUserFavoriteSong', 'parameters': {'songID': 0}, 'header': {'wsKey': 'key', 'sessionID': 'sessionID'}}"
#   // , payload = "{'method': 'startSession'}"
#   , hash
#   ;
# 
# hash = crypto.createHmac('md5', key).update(payload).digest('hex');
# 
# console.log('this is hash', hash);
# 
# function apiCall(method, param, header) {
#   console.log(method, param, header)
# }
# 
# apiCall('woot', 'hey', 3);
