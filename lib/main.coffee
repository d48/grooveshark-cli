path    = require('path')
config  = require(path.join __dirname, '..', 'config.json')
crypto  = require('crypto')
exec    = require('child_process').exec
# api   = require('../lib/api.coffee')
log     = console.log
apiurl  = "https://api.grooveshark.com/ws3.php"

# process command
execute = (cmd, cb) ->
  log "this is your command: #{cmd}"

  exec "#{cmd}", (err, stdout, stderr) ->
    if not err?
        log "successful execution of command: #{cmd}"
    else 
        log "there was an error: #{err}"


createSig = (pload) ->
  crypto.createHmac('md5', config.secret).update(pload).digest('hex')
 
# available commands from cli
module.exports =
  play: ->
    execute 'play'

  startsession: (args...) ->
    # args: methodname + parameters + header
    # {
    #   'method': 'addUserFavoriteSong',
    #   'parameters': {
    #       'songID': 0
    #   },
    #   'header': {   
    #     'wsKey': 'key',
    #     'sessionID': 'sessionID' # <optional> 
    #   }
    # }
    method = '"method": "startSession"'
    params = '"parameters": {}'
    header = '"header": {"wsKey": \"' + config.key + '\"}'

    payload = "{#{method},#{params},#{header}}"
    log payload

    apisig  = createSig(payload)
    request = "\ncurl -X POST #{apiurl}?sig=#{apisig} -d \'#{payload}\'"

    log request

  help: ->
    log "help"
