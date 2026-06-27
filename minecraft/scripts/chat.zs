#reloadable

import mods.crtadd.vanilla.ClientChatReceivedEvent;

import mods.zenutils.I18n;


events.onClientChatReceived(function(event as ClientChatReceivedEvent) {
    if(event.message.contains("You need the §eExcavate Modifier §ror the §6Enchantment §ron your tool to be able to excavate!")){
        event.setMessage(I18n.format("hymnofheroism.chat.oreexcavation"));
    }
});