var crypto = require('crypto')
  , secret  = '9e0004414522dafa6c9e466f940fde60'
  // , key = 'secret'
  , key = 'unix_design48'
  , payload = "{'method': 'addUserFavoriteSong', 'parameters': {'songID': 0}, 'header': {'wsKey': 'key', 'sessionID': 'sessionID'}}"
  // , payload = "{'method': 'startSession'}"
  , hash
  ;

hash = crypto.createHmac('md5', key).update(payload).digest('hex');

console.log('this is hash', hash);

function apiCall(method, param, header) {
  console.log(method, param, header)
}

apiCall('woot', 'hey', 3);
