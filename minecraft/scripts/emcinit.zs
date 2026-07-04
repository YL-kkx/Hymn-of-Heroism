import mods.ctintegration.projecte.EMCManager;

import crafttweaker.item.IItemStack;
for itemDefinitions in game.items{
    for item in itemDefinitions.subItems{
        EMCManager.setEMC(item,1);
    }
}

//黑名单
var item as IItemStack[]=[
    #原版
    <minecraft:enchanted_book>.withTag({}),
    #Cot
    <contenttweaker:randomequipmentchest>,
    #匠魂
    <tconstruct:pickaxe>.withTag({}),
    <tconstruct:shovel>.withTag({}),
    <tconstruct:hatchet>.withTag({}),
    <tconstruct:mattock>.withTag({}),
    <tconstruct:kama>.withTag({}),
    <tconstruct:hammer>.withTag({}),
    <tconstruct:excavator>.withTag({}),
    <tconstruct:lumberaxe>.withTag({}),
    <tconstruct:scythe>.withTag({}),
    <tconstruct:broadsword>.withTag({}),
    <tconstruct:longsword>.withTag({}),
    <tconstruct:rapier>.withTag({}),
    <tconstruct:frypan>.withTag({}),
    <tconstruct:battlesign>.withTag({}),
    <tconstruct:cleaver>.withTag({}),
    <tconstruct:shortbow>.withTag({}),
    <tconstruct:longbow>.withTag({}),
    <tconstruct:crossbow>.withTag({}),
    <tconstruct:arrow>.withTag({}),
    <tconstruct:bolt>.withTag({}),
    <tconstruct:shuriken>.withTag({}),
    <conarm:helmet>.withTag({}),
    <conarm:chestplate>.withTag({}),
    <conarm:leggings>.withTag({}),
    <conarm:boots>.withTag({})

];
for i in item{
    EMCManager.setIngredientEMC(i,0);
}


EMCManager.mapEMC();