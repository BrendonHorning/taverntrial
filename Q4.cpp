void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = nullptr; // using "new" adds player to heap and will cause memory leak. already set to be class Player in line 2 so not needed for line 5?
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        } // i imagine if loadPlayerByName is successful it moves pointer, nothing is left in heap so there is no leak.
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}
