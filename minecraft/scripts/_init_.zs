//reloadable
import crafttweaker.event.PlayerLoggedInEvent;
import mods.roidtweaker.forge.config.Reader;
import mods.roidtweaker.forge.config.IConfigFile;

import mods.zenutils.I18n;

global initall as bool[] = [true];

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    //初始化MOD(水游技艺)
    val aquaacrobatics as IConfigFile = Reader.getConfigFile("config/aquaacrobatics.cfg");
    if(aquaacrobatics.getBool("general.miscellaneous","Replenish Air Slowly") == false){
        initall[0] = false;
        event.player.sendChat(I18n.format("hymnofheroism.init.error", "aquaacrobatics"));
    }
    //初始化MOD(动态的树)
    val dynamictrees as IConfigFile = Reader.getConfigFile("config/dynamictrees.cfg");
    if(dynamictrees.getBool("interaction","isLeavesPassable") == false){
        initall[0] = false;
        event.player.sendChat(I18n.format("hymnofheroism.init.error", "dynamictrees"));
    }
    //初始化MOD(等价交换)
    val projecte as IConfigFile = Reader.getConfigFile("config/ProjectE/ProjectE.cfg");
    if(projecte.getBool("general.difficulty","covalenceLossRounding") == true &&
    projecte.getDouble("general.difficulty","covalenceLoss") != 0.1){
        initall[0] = false;
        event.player.sendChat(I18n.format("hymnofheroism.init.error", "projecte"));
    }
    // 发送初始化完成消息
    if(initall[0]){
        event.player.sendChat(I18n.format("hymnofheroism.init", I18n.format("hymnofheroism.init.true")));
    }else{
        event.player.sendChat(I18n.format("hymnofheroism.init", I18n.format("hymnofheroism.init.false")));
    }
});