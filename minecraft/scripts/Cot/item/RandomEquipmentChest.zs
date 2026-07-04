#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.crtadd.tconstruct.TconStructIRandom;

var zsItem = VanillaFactory.createItem("randomequipmentchest");
zsItem.maxStackSize = 64;
zsItem.rarity = "epic";
zsItem.maxDamage = -1;
zsItem.itemRightClick = function(stack, world, player, hand) {
    player.give(TconStructIRandom.Random("helmet"));
    player.give(TconStructIRandom.Random("chestplate"));
    player.give(TconStructIRandom.Random("leggings"));
    player.give(TconStructIRandom.Random("boots"));
    player.give(TconStructIRandom.Random("tool"));
    stack.shrink(1);
    return "Pass";
};
zsItem.register();