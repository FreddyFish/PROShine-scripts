-- Copyright © 2016 FreddyFish
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Route 43 (Near Mahogany Town)"
author = "FreddyFish"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Mahogany Town and Route 43. Thanks to Silv3r for the template.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Mahogany" then
			moveToMap("Mahogany Town")
		elseif getMapName() == "Mahogany Town" then
			moveToMap("Route 43")
		elseif getMapName() == "Route 43" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 43" then
			moveToMap("Mahogany Town")
		elseif getMapName() == "Mahogany Town" then
			moveToMap("Pokecenter Mahogany")
		elseif getMapName() == "Pokecenter Mahogany"	 then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
