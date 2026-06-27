#reloadable
import mods.ctintegration.projecte.EMCManager;

for itemDefinitions in game.items{
    for item in itemDefinitions.subItems{
        EMCManager.setEMC(item,1);
    }
}

EMCManager.setIngredientEMC(<minecraft:enchanted_book>.withTag({}), 0);

EMCManager.mapEMC();