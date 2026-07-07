#reloadable

import crafttweaker.event.PlayerItemPickupEvent;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;

import mods.crtadd.projecte.KnowledgeProvider;

events.onPlayerItemPickup(function(event as PlayerItemPickupEvent) {
    var player as IPlayer = event.player;
    var world as IWorld = player.world;
    var item as IItemStack = event.stackCopy;
    if(world.remote) return;
    if(item.hasTag) return;
    if(initmodpack[0] == "casual"){
        var newitem as IItemStack = itemUtils.getItem(item.definition.id);
        if(!player.knowledge.hasKnowledge(newitem)){
            player.knowledge.addKnowledge(newitem);
        }  
    }
});