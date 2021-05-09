let spawnis = {
    run: function(roomname) {
        var allspawns = Game.rooms[roomname].find(FIND_MY_SPAWNS);
        for (var i = 0; i < allspawns.length; i++) {
            var harvesters = _.filter(Game.creeps, (creep) => creep.memory.role == 'harvester');
            console.log('Harvesters: ', harvesters.length);
            var upgraders = _.filter(Game.creeps, (creep) => creep.memory.role == 'upgrader');
            console.log('Upgraders: ', upgraders.length);
            var builders = _.filter(Game.creeps, (creep) => creep.memory.role == 'builder');
            console.log('Builders: ', builders.length);
            var haulers = _.filter(Game.creeps, (creep) => creep.memory.role == 'hauler');
            console.log('Haulers: ',haulers.length);
            var repairers = _.filter(Game.creeps, (creep) => creep.memory.role == 'repairer');
            console.log('Repairers: ', repairers.length);
            var towers = room.find(FIND_STRUCTURES, {filter: (structure) => {return (structure.structureType == STRUCTURE_TOWER)}});
            if (harvesters.length == 0) {
                var newName = 'Harvester' + Game.time;
                console.log('Spawning new harvester: ' + newName);
                allspawns[i].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                    memory: {
                        role: 'harvester'
                    }
                });
            }
            if (upgraders.length == 0) {
                var newName = 'Upgrader' + Game.time;
                console.log('Spawning new upgrader: ' + newName);
                allspawns[i].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                    memory: {
                        role: 'upgrader'
                    }
                });
            }
            if (builders.length == 0) {
                var newName = 'Builder' + Game.time;
                console.log('Spawning new builder: ' + newName);
                allspawns[i].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                    memory: {
                        role: 'builder'
                    }
                });
            }
            if (haulers.length == 0) {
                var newName = 'Hauler' + Game.time;
                console.log('Spawning new hauler: ' + newName);
                allspawns[i].spawnCreep([CARRY, CARRY, MOVE, MOVE], newName, {
                    memory: {
                        role: 'hauler'
                    }
                });
            }
            if (repairers.length == 0) {
                var newName = 'Repairer' + Game.time;
                console.log('Spawning new repairer: ' + newName);
                allspawns[i].spawnCreep([WORK, WORK, CARRY, MOVE, MOVE], newName, {
                    memory: {
                        role: 'repairer'
                    }
                });
            }
            if (allspawns[i].spawning) {
                var spawningCreep = Game.creeps[allspawns[i].spawning.name];
                allspawns[i].room.visual.text(
                    '🛠️' + spawningCreep.memory.role,
                    allspawns[i].pos.x + 1,
                    allspawns[i].pos.y, {
                        align: 'left',
                        opacity: 0.8
                    });
            }
            for(var tower = 0; tower < towers.length; tower++) { 
                var closestDamagedStructure = towers[tower].pos.findClosestByRange(FIND_STRUCTURES, {
                    filter: (structure) => structure.hits < structure.hitsMax
                });
                if (closestDamagedStructure  && closestDamagedStructure.structureType != STRUCTURE_RAMPART ) {
                    towers[tower].repair(closestDamagedStructure);
                }
                var closestHostile = towers[tower].pos.findClosestByRange(FIND_HOSTILE_CREEPS);
                if (closestHostile) {
                    towers[tower].attack(closestHostile);
                }
            }
        }
    }
}
module.exports = spawnis;
