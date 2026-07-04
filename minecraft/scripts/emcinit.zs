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
    <contenttweaker:randomequipmentchest>
];
for i in item{
    EMCManager.setIngredientEMC(i,0);
}


EMCManager.mapEMC();