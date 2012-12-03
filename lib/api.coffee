path   = require('path')
config = require(path.join __dirname, '../config', 'config.json')
crypto = require('crypto')
request = require('request')
apiurl = "https://api.grooveshark.com/ws3.php"
log    = console.log
api

# Available methods
module.exports =
  createSig: (pload) ->
    crypto.createHmac('md5', config.secret).update(pload).digest('hex')

  sendApiReq: (req, cb) ->

  ###
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
  ###
  startSession: ->
    payload = 
      method: "startSession"
      parameters: {}
      header: 
        wsKey: config.key

    doRequest payload


  createUserToken: (user, pass) ->
    md5(user.toLowerCase() + md5(pass))

  authenticateUser: ->
    # sessionID + username + token 
    #   token = md5(lowercase(username) + md5(password))

    payload = 
      method: "authenticateUser"
      parameters: 
        username: config.username
        token: @createUserToken(config.username, config.password)
      header:
        wsKey: config.key
        sessionID: "3c53defdffffc814cd979f808c4d092e"
        
    # sessionID: @createSession

    payload = JSON.stringify payload 
    log payload

    sig = @createSig(payload)

    request = "\ncurl -X POST #{apiurl}?sig=#{sig} -d \'#{payload}\'"
    log request

    # make request and parse callback

     
  # sessionID returned from initial sessionstart, and then validate after authenticateUser
  # pass through to next payload request. this works
  getUserPlaylists: ->
    payload =
      method: "getUserPlaylists"
      parameters: {}
      header:
        wsKey: config.key
        sessionID: "3c53defdffffc814cd979f808c4d092e"
        
    payload = JSON.stringify payload 
    log payload

    sig = @createSig(payload)

    request = "\ncurl -X POST #{apiurl}?sig=#{sig} -d \'#{payload}\'"
    log request


################################################################################
# private methods
################################################################################

# make available to private method
api = module.exports

# md5 using key
md5 = (key) ->
  crypto.createHash('md5').update(key).digest('hex')

doRequest = (payload, cb) ->
  # setup req options
  options = {}
  options.url = apiurl

  payload = JSON.stringify payload
  log payload
  
  sig = api.createSig(payload)

  # testing at command line
  request = "\ncurl -X POST #{apiurl}?sig=#{sig} -d \'#{payload}\'"
  log request

  # execute command and parse result, saving into local session var to be used
  # request.post options, callback


