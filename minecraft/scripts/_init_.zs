#reloadable
import crafttweaker.event.PlayerLoggedInEvent;
import mods.roidtweaker.forge.config.Reader;
import mods.roidtweaker.forge.config.IConfigFile;

import mods.zenutils.I18n;

global initbool as bool[] = [true];

global init as bool[string]={
    "aquaacrobatics":true,
    "dynamictrees":true
};

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    #初始化MOD(水游技艺)
    val aquaacrobatics as IConfigFile = Reader.getConfigFile("config/aquaacrobatics.cfg");
    init["aquaacrobatics"]=aquaacrobatics.getBool("general.miscellaneous","Replenish Air Slowly");
    #初始化MOD(动态的树)
    val dynamictrees as IConfigFile = Reader.getConfigFile("config/dynamictrees.cfg");
    init["dynamictrees"]=dynamictrees.getBool("interaction","isLeavesPassable");
    
    # 遍历检查init数组
    for key, value in init {
        if (!value) {
            initbool[0] = false;
            event.player.sendChat(I18n.format("hymnofheroism.init.error", key));
        }
    }
    # 发送初始化完成消息
    if(initbool[0]){
        event.player.sendChat(I18n.format("hymnofheroism.init", I18n.format("hymnofheroism.init.true")));
    }else{
        event.player.sendChat(I18n.format("hymnofheroism.init", I18n.format("hymnofheroism.init.false")));
    }
});