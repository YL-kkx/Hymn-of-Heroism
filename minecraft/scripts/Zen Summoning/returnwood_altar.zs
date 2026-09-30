import mods.zensummoning.SummoningDirector;
import mods.zensummoning.SummoningAttempt;
import mods.zensummoning.SummoningInfo;
import mods.zensummoning.MobInfo;

import crafttweaker.entity.IEntity;

SummoningDirector.addSummonInfo(
    SummoningInfo.create()
        .setCatalyst(<botania:manaresource:2> | <naturesaura:infused_iron>)
        .setReagents([<ore:treeSapling>* 4])
        .addMob(MobInfo.create()
            .setMob("tragicmc:yelnor")
        )
);