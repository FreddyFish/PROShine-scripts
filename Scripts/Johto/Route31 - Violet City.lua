-- Copyright © 2016 FreddyFish
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Route 31 (Near Violet City)"
author = "FreddyFish"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Violet City and route 31. Thanks to Silv3r for the template.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Violet City" then
			moveToMap("Violet City")
		elseif getMapName() == "Violet City" then
			moveToMap("Violet City Stop House")
		elseif getMapName() == "Violet City Stop House" then
			moveToMap("Route 31")
		elseif getMapName() == "Route 31" then
			moveToRectangle(8, 20, 9, 21)
		end
	else
		if getMapName() == "Route 31" then
			moveToMap("Violet City Stop House")
		elseif getMapName() == "Violet City Stop House" then
			moveToMap("Violet City")
		elseif getMapName() == "Violet City" then
			moveToMap("Pokecenter Violet City")
		elseif getMapName() == "Pokecenter Violet City"	 then
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
