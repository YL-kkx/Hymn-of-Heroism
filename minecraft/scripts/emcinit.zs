for itemDefinitions in game.items{
    for item in itemDefinitions.subItems{
        item.setEMC(1);
    }
}