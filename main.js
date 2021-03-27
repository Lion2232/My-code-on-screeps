//main.js
var roles = require('roles.mod');
var spawns = require('spawns.mod')
module.exports.loop = function() {
        
        roles.run()
        spawns.run()
}
