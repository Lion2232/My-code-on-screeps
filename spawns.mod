let spawnis = {
    run: function(roomname) {
            console.log('Spawns.mod works!');
            var allspawns = Game.rooms[roomname].find(FIND_MY_SPAWNS);
            for (var i; i < allspawns; i++) {
                console.log('Loop works!')
                var harvesters = _.filter(Game.creeps, (creep) => creep.memory.role == 'harvester');
                var upgraders = _.filter(Game.creeps, (creep) => creep.memory.role == 'upgrader');
                var builders = _.filter(Game.creeps, (creep) => creep.memory.role == 'builder');
                var haulers = _.filter(Game.creeps, (creep) => creep.memory.role == 'hauler');
                var repairers = _.filter(Game.creeps, (creep) => creep.memory.role == 'repairer');
                var tower = Game.getObjectById('60415d18abf74db642de2ce6');
                var towerTwo = Game.getObjectById('6053d09137ff393f185e36e5');
                if (harvesters.length == 0) {
                    var newName = 'Harvester' + Game.time;
                    console.log('Spawning new harvester: ' + newName);
                    Game.spawns[allspawns[i]].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                        memory: {
                            role: 'harvester'
                        }
                    });
                    console.log('If condition works!');
                }
                if (upgraders.length == 0) {
                    var newName = 'Upgrader' + Game.time;
                    console.log('Spawning new upgrader: ' + newName);
                    Game.spawns[allspawns[i]].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                        memory: {
                            role: 'upgrader'
                        }
                    });
                }
                if (builders.length == 0) {
                    var newName = 'Builder' + Game.time;
                    console.log('Spawning new builder: ' + newName);
                    Game.spawns[allspawns[i]].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                        memory: {
                            role: 'builder'
                        }
                    });
                }
                if (haulers.length == 0) {
                    var newName = 'Hauler' + Game.time;
                    console.log('Spawning new hauler: ' + newName);
                    Game.spawns[allspawns[i]].spawnCreep([CARRY, CARRY, MOVE, MOVE], newName, {
                        memory: {
                            role: 'hauler'
                        }
                    });
                }
                if (repairers.length == 0) {
                    var newName = 'Repairer' + Game.time;
                    console.log('Spawning new repairer: ' + newName);
                    Game.spawns[allspawns[i]].spawnCreep([WORK, WORK, CARRY, MOVE, MOVE], newName, {
                        memory: {
                            role: 'repairer'
                        }
                    });
                }
                if (Game.spawns[allspawns[i]].spawning) {
                    var spawningCreep = Game.creeps[Game.spawns[allspawns[i]].spawning.name];
                    Game.spawns[allspawns[i]].room.visual.text(
                        '🛠️' + spawningCreep.memory.role,
                        Game.spawns[allspawns[i]].pos.x + 1,
                        Game.spawns[allspawns[i]].pos.y, {
                            align: 'left',
                            opacity: 0.8
                        });
                }
                if (tower || towerTwo) {
                    var closestDamagedStructure = tower.pos.findClosestByRange(FIND_STRUCTURES, {
                        filter: (structure) => structure.hits < structure.hitsMax
                    });
                    if (closestDamagedStructure /* && closestDamagedStructure.structureType != STRUCTURE_RAMPART*/ ) {
                        tower.repair(closestDamagedStructure);
                        towerTwo.repair(closestDamagedStructure);
                    }
                    var closestHostile = tower.pos.findClosestByRange(FIND_HOSTILE_CREEPS);
                    if (closestHostile) {
                        tower.attack(closestHostile);
                        towerTwo.attack(closestHostile);
                    }
                }
            }
        }
    }
module.exports = spawnis;
