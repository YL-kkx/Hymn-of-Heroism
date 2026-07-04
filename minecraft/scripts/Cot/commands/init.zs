import mods.zenutils.command.ZenCommand;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;

import crafttweaker.world.IWorld;

val initCommand as ZenCommand = ZenCommand.create("init");
initCommand.getCommandUsage = function(sender) {
    return "hymnofheroism.command.init.usage";
};
initCommand.requiredPermissionLevel = 2; 
initCommand.execute = function(command, server, sender, args) {
    var world as IWorld=server.world;
    var txet  = args[0];
    world.updateCustomWorldData({init: txet});

};
initCommand.register();