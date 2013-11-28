path    = require('path')
config  = require(path.join __dirname, '../config', 'config.json')
crypto  = require('crypto')
request = require('request')
apiurl  = "https://api.grooveshark.com/ws3.php"
log     = console.log
api     = ''

# Available methods
module.exports =
  createSig: (pload) ->
    crypto.createHmac('md5', config.secret).update(pload).digest('hex')

  sendApiReq: (req, cb) ->

  startSession: ->
    payload = 
      method: "startSession"
      parameters: {}
      header: 
        wsKey: config.key

    doRequest payload

  createUserToken: (user, pass) ->
    md5(user.toLowerCase() + md5(pass))

  # todo: remove hardCoded sessionID
  authenticateUser: ->
    payload = 
      method: "authenticateUser"
      parameters: 
        username: config.username
        token: @createUserToken(config.username, config.password)
      header:
        wsKey: config.key
        sessionID: "3c53defdffffc814cd979f808c4d092e"
        
    # sessionID: @createSession
    doRequest payload

     
  ###
  # sessionID returned from initial sessionstart, and then validate
  # after authenticateUser. Pass through to next payload request. 
  # todo: remove hardCoded sessionID
  ###
  getUserPlaylists: ->
    payload =
      method: "getUserPlaylists"
      parameters: {}
      header:
        wsKey: config.key
        sessionID: "3c53defdffffc814cd979f808c4d092e"
        
    doRequest payload

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

  # todo: execute command and parse result, saving into local session var to be used
  # request.post options, callback


