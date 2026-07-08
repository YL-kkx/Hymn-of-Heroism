#reloadable

import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import mods.zenutils.I18n;

import mods.crtadd.projecte.KnowledgeProvider;

events.onPlayerTick(function(event as PlayerTickEvent) {
    var player as IPlayer = event.player;
    var world as IWorld = player.world;
    
    if(world.remote) return;
    if(world.getWorldTime() % 20 == 0){
        for i in 0 to 35{
            var item as IItemStack = player.getInventoryStack(i);
                if(isNull(item)) continue;
                if(item.hasTag) continue;
                if(item.emc == 0) continue;
                var newitem as IItemStack = itemUtils.getItem(item.definition.id,item.metadata);
                if(item.maxDamage != 0){
                    newitem= itemUtils.getItem(item.definition.id);
                }
                if(!player.knowledge.hasKnowledge(newitem)){
                    player.knowledge.addKnowledge(newitem);
                }
            }
    }
});