//main.js
var roles = require('roles.mod');
var spawns = require('spawns.mod');
module.exports.loop = function() {
        roles.run()
        var rooms = [];
        var roomsall = Object.keys(Game.rooms);
        var roomsobj = Game.rooms;
        for(var i = 0; i < roomsall.length; i++)
        {
            if(roomsobj[roomsall[i]].controller != undefined)
            {
                if(roomsobj[roomsall[i]].controller.owner != undefined)
                {
                    if((roomsobj[roomsall[i]]).controller.owner.username === "StrangerCreep")
                    {
                    rooms.push(roomsall[i]);
                    }
                }
            }
        }
        for (var i=0; i < rooms.length; i++) {
            console.log(rooms.length);
            #spawns.run();
            
          
          
        }
}
