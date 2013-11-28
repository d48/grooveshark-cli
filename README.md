# Introduction

This is a command line interface (CLI) to work with Grooveshark.com's api for using their data and streaming.

## Installation

1. Clone the repo
`$ git clone git@github.com:design48/grooveshark-cli.git && cd grooveshark-cli`

2. Install dependencies
`$ npm install`

3. Link command to your path
`$ npm link`

4. Request API access from Grooveshark
http://developers.grooveshark.com/api

5. Update API key in <repo>/config/config.json
```
{
    "key": "GROOVESHARK_KEY"
  , "secret": "GROOVESHARK_SECRET"
  , "username": "GROOVESHARK_USERNAME"
  , "password": "GROOVESHARK_PASSWORD"
}
```


## Usage

Yay, it has colors!

![usage](http://content.screencast.com/users/User48/folders/Jing/media/a5cbde98-dfa6-4e56-a1a7-1acdec01b23c/00000083.png)


## Version status

This is still under development and not ready for use.

**@todo**

1. Setting up request format
2. Integrating socket.io to control webpage flash player from the command line
3. Move private vars used by methods to private area outside of module.exports, e.g., createSig method

