 var rolerepair = require('role.repairer');
var roleHarvester = require('role.harvester');
var rolemover = require('role.mover');
var roleupgrader = require('role.upgrader');
var roletowermover = require('role.towermover');
var roleresourcemover = require('role.resourcemover');
var roleextractor = require('role.extractor');
var roleguard = require('role.basicroomguard');
var rolescout = require('role.scout');
var rolemulti = require('role.multi');
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
