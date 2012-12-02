colors = require('colors')

theme =
  help: "yellow"
  error: "red"
  success: "green"

colors.setTheme theme

module.exports = 
  format: (item, color) ->
    switch color
      when "error" then item.red
      when "success" then item.green
      when "help" then item.cyan
      when "warning" then item.yellow
      else item.white




