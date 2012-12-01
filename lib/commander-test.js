#! /usr/bin/env node

require('coffee-script')

program = require('commander')
log     = console.log


program
  .version('0.0.1')
  .option '-p, --peppers', 'Add peppers')
  .option('-c, --cheese', 'Add cheese')

program.parse(process.argv)


if(program.peppers) {
  log('ordering peppers')
}

if(program.cheese) {
  log('ordering cheese')
}
