#reloadable
import crafttweaker.event.PlayerLoggedInEvent;
import mods.roidtweaker.forge.config.Reader;
import mods.roidtweaker.forge.config.IConfigFile;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import mods.contenttweaker.Commands;
import mods.crtadd.projecte.KnowledgeProvider;
import mods.zenutils.I18n;

global initall as bool[] = [true];

global initmodpack as string[]=["adventure"];


events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    var player as IPlayer = event.player;
    var world as IWorld = player.world;
    if(world.remote) return;
    //初始化MOD(水游技艺)
    val aquaacrobatics as IConfigFile = Reader.getConfigFile("config/aquaacrobatics.cfg");
    if(aquaacrobatics.getBool("general.miscellaneous","Replenish Air Slowly") == false){
        initall[0] = false;
        player.sendChat(I18n.format("hymnofheroism.init.error", "aquaacrobatics"));
    }
    //初始化MOD(动态的树)
    val dynamictrees as IConfigFile = Reader.getConfigFile("config/dynamictrees.cfg");
    if(dynamictrees.getBool("interaction","isLeavesPassable") == false){
        initall[0] = false;
        player.sendChat(I18n.format("hymnofheroism.init.error", "dynamictrees"));
    }
    //初始化MOD(等价交换)
    val projecte as IConfigFile = Reader.getConfigFile("config/ProjectE/ProjectE.cfg");
    if(projecte.getBool("general.difficulty","covalenceLossRounding") == true &&
    projecte.getDouble("general.difficulty","covalenceLoss") != 0.1){
        initall[0] = false;
        player.sendChat(I18n.format("hymnofheroism.init.error", "projecte"));
    }
    // 发送初始化完成消息
    if(initall[0]){
        player.sendChat(I18n.format("hymnofheroism.init", I18n.format("hymnofheroism.init.true")));
    }else{
        player.sendChat(I18n.format("hymnofheroism.init", I18n.format("hymnofheroism.init.false")));
    }

    // 初始化存档
    if(isNull(player.data.PlayerPersisted.init)){
        player.update({PlayerPersisted: {init: initmodpack[0]}});
        player.sendChat(I18n.format("hymnofheroism.init.world", I18n.format("hymnofheroism.init.world."~ player.data.PlayerPersisted.init )));
        if(initmodpack[0] == "adventure" || initmodpack[0] == "casual"){
            player.give(<contenttweaker:randomequipmentchest>);
        }
        if(initmodpack[0] == "casual"){
            player.setPersonalEMC(99999999999999);
            player.give(<projectex:arcane_tablet>);
        }
    }
    initmodpack[0]=player.data.PlayerPersisted.init;
});