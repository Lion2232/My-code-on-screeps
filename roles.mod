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
var harvesters = _.filter(Game.creeps, (creep) => creep.memory.role == 'harvester');
var upgraders = _.filter(Game.creeps, (creep) => creep.memory.role == 'upgrader');
var builders = _.filter(Game.creeps, (creep) => creep.memory.role == 'builder');
var haulers = _.filter(Game.creeps, (creep) => creep.memory.role == 'hauler');
var repairers = _.filter(Game.creeps, (creep) => creep.memory.role == 'repairer');
var debug = true;
var roles = {
    run: function()
    {
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
}
module.exports = roles;}
