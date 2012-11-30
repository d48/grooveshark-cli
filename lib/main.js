// Generated by CoffeeScript 1.3.3
(function() {
  var exec, execute, log, startme;

  exec = require('child_process').exec;

  log = console.log;

  execute = function(cmd, cb) {
    log("this is your command: " + cmd);
    return exec("" + cmd, function(err, stdout, stderr) {
      if (!(err != null)) {
        return log("successful execution of command: " + cmd);
      } else {
        return log("there was an error: " + err);
      }
    });
  };

  startme = function() {
    return log("starting this");
  };

  module.exports = {
    play: function() {
      return execute('play');
    },
    start: function() {
      return startme();
    },
    help: function() {
      return log("help");
    }
  };

}).call(this);