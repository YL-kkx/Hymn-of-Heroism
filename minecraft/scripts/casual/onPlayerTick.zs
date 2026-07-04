#reloadable

import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;

import mods.crtadd.projecte.KnowledgeProvider;

events.onPlayerTick(function(event as PlayerTickEvent) {
    var player as IPlayer = event.player;
    var world as IWorld = player.world;
    if(world.remote) return;
    if(world.getWorldTime() % 20 == 0){
        for i in 0 to 35{
            if(!player.knowledge.hasKnowledge(player.getInventoryStack(i))){
                player.knowledge.addKnowledge(player.getInventoryStack(i));
            }
        }
    }
});