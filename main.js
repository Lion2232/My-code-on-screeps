//main.js
var roleHarvester = require('role.harvester');
var roleUpgrader = require('role.upgrader');
var roleBuilder = require('role.builder');
var roleHauler = require('role.hauler');
var roleAttacker = require('role.attacker');
var roleAssigner = require('role.assigner');
var roleRepairer = require('role.repairer');
var roleClaimer = require('role.claimer');
var roleGuard = require('role.guard');
var roleGhealer = require('role.ghealer');
module.exports.loop = function() {
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
            Game.spawns['Spawn1'].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                memory: {
                    role: 'harvester'
                }
            });
        }
        if (upgraders.length == 0) {
            var newName = 'Upgrader' + Game.time;
            console.log('Spawning new upgrader: ' + newName);
            Game.spawns['Spawn1'].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                memory: {
                    role: 'upgrader'
                }
            });
        }
        if (builders.length == 0) {
            var newName = 'Builder' + Game.time;
            console.log('Spawning new builder: ' + newName);
            Game.spawns['Spawn1'].spawnCreep([WORK, WORK, CARRY, MOVE], newName, {
                memory: {
                    role: 'builder'
                }
            });
        }
        if (haulers.length == 0) {
            var newName = 'Hauler' + Game.time;
            console.log('Spawning new hauler: ' + newName);
            Game.spawns['Spawn1'].spawnCreep([CARRY, CARRY, MOVE, MOVE], newName, {
                memory: {
                    role: 'hauler'
                }
            });
        }
        if (repairers.length == 0) {
            var newName = 'Repairer' + Game.time;
            console.log('Spawning new repairer: ' + newName);
            Game.spawns['Spawn1'].spawnCreep([WORK, WORK, CARRY, MOVE, MOVE], newName, {
                memory: {
                    role: 'repairer'
                }
            });
        }
        if (Game.spawns['Spawn1'].spawning) {
            var spawningCreep = Game.creeps[Game.spawns['Spawn1'].spawning.name];
            Game.spawns['Spawn1'].room.visual.text(
                '🛠️' + spawningCreep.memory.role,
                Game.spawns['Spawn1'].pos.x + 1,
                Game.spawns['Spawn1'].pos.y, {
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
        for (var name in Game.creeps) {
            var creep = Game.creeps[name];
            if (creep.memory.role == 'harvester') {
                roleHarvester.run(creep);
            }
            if (creep.memory.role == 'upgrader') {
                roleUpgrader.run(creep);
            }
            if (creep.memory.role == 'builder') {
                roleBuilder.run(creep)
            }
            if (creep.memory.role == 'hauler') {
                roleHauler.run(creep)
            }
            if (creep.memory.role == 'attacker') {
                roleAttacker.run(creep);
            }
            if (creep.memory.role == 'assigner') {
                roleAssigner.run(creep);
            }
            if (creep.memory.role == 'repairer') {
                roleRepairer.run(creep);
            }
            if (creep.memory.role == 'claimer') {
                roleClaimer.run(creep);
            }
            if (creep.memory.role == 'guard') {
                roleGuard.run(creep);
            }
            if (creep.memory.role == 'ghealer') {
                roleGhealer.run(creep);
            }
            if (Game.cpu.bucket == 10000) {
                Game.cpu.generatePixel();
            }
        }
}
