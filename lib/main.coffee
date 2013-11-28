exec = require('child_process').exec
api  = require('./api.coffee')
f    = require('./formatter.coffee')
log  = console.log

# process command
execute = (cmd, cb) ->
  log "this is your command: #{cmd}"

  calback = (error, response) ->
    cb error, response if cb?

  exec "#{cmd}", (err, stdout, stderr) ->
    if err?
        log f.format "there was an error: #{err}", "error"
    else 
        log f.format "successful execution of command: #{cmd}", "success"

# available commands from cli
module.exports =
  # play: ->
    # execute 'play'

  auth: ->
    api.authenticateUser()

  session: ->
    api.startSession()

  help: ->
    log "\nUsage:\n"
    log f.format "    groove <command> <args>", "help"

  playlists: ->
    api.getUserPlaylists()



