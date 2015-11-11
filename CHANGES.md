Glossary
--------

* [N] - new feature / addon
* [M] - modified restoration
* [R] - restored feature
* [F] - fix


Gameplay changes
----------------

+ [N] Liquid Slime can be harvested and placed. Also replaced Slime status effect icon to match the style of new liquid item

+ [M] Green Slime can be crafted from 2 Liquid Slime in Crafting Table

+ [N] Peach Juice liquid definition (id:4) and liquid item

+ [R] Coffee liquid definition (id:9) and liquid item

+ [N] Frostygen liquid definitions (id:10) and liquid item

+ [N] Implemented more liquid interactions (also added all interactions from Lava to Core lava. Yes, you can harvest it too):
 - Healing water + Water => Healing water
 - Healing water + Poison => Water
 - Healing water + Erchius Fuel => Water
 - Peach juice + Water => Water
 - Peach juice + Poison => Poison
 - Peach juice + Healing water => Healing water
 - Peach juice + Coffee => Coffee
 - Swamp water + Water => Swamp water
 - Swamp water + Poison => Poison
 - Swamp water + Healing water => water
 - Slime + Water => Slime
 - Slime + Poison => Slime
 - Slime + Tar => Slime
 - Slime + Healing water => Slime
 - Slime + Milk => Slime
 - Slime + Coffee => Slime
 - Slime + Erchius fuel = Slime
 - Slime + Swamp water => Slime
 - Frostygen + Water => Ice block
 - Frostygen + Poison => Ice block
 - Frostygen + Peach juice => Ice block
 - Frostygen + Healing water => Ice block
 - Frostygen + Coconut milk => Ice block
 - Frostygen + coffee => Ice block
 - Frostygen + Swamp water => Ice block
 - Frostygen + Slime => Ice block
 - (Core) Lava + Healing water => Magma rock
 - (Core) Lava + Alien juice => Magma rock
 - (Core) Lava + Poison => Magma rock
 - (Core) Lava + Coffee => Magma rock
 - (Core) Lava + Swamp water => Magma rock
 - (Core) Lava + Slime => Magma rock

+ [M] Renamed "Coffee Seed" into "Raw Coffee Beans". You can roast them in Microwave or Campfire and get consumable "Coffee Beans"

+ [R] Glass Coffee Mug can be crafted via Crafting Table for 2 Glass Blocks

+ [R] Steel Spoon can be crafted via Metalwork Station for 1 Steel Bar

+ [R] Liquid Coffee can be crafted via Coffee Machine for 1 Coffee Beans

+ [R] Coffee-related questline will be given by Human Survivor at the Outpost after completion of his "Rent Well Spent" quest (no progress requirements)

+ [F] Toy (Lego) Blocks no longer fall when placed. Now it's possible to build colourful plastic castles

+ [F] Book Blocks act like platforms and can be passed through

+ [R] Heart Forge can be crafted via Crafting Table with 1 Campfire, 15 Golden Bars and 150 Pixels

+ [R] Holiday Crafting Table can be crafted for 35 Wood

+ [R] Steel Bar can be crafted in Alloy Furnace from 1 Iron Bar and 1 Coal (same as in EK)

+ [M] Durasteel Bar can be crafted in Sci-Fi Furnace from 2 Titanium Bars and 5 Coal (was 1 Titanium and 5 Coal in EK)

+ [M] Cerulium Compound can be crafted in Sci-Fi Furnace from 2 Refined Rubium and 1 Solarium Star

+ [M] Ferozium Compound can be crafted in Sci-Fi Furnace from 2 Refined Aegisalt and 1 Solarium Star

+ [M] Impervium Compound can be crafted in Sci-Fi Furnace from 2 Refined Violium and 1 Solarium Star

+ [R] Uranium and Solarium ore will spawn in previously unvisited worlds (same as in UG)

+ [N] Uranium will spawn on the previously unvisited Moon planets along with Solarium and Plutonium

+ [R] Uranium rod can be crafted in Alloy Furnace for 2 Uranium Ore

+ [R] Solarium Star can be crafted in Sci-Fi Furnace for 2 Solarium Ore

+ [R] Silver, Golden and Titanium ore will spawn at the planets with any difficulty

+ [M] Recoloured Titanium Ore and Titanium Bars to be more distinguishable from Silver and Iron

+ [R] Diamond ore will spawn instead of "perfectly cut" diamonds in unvisited worlds (diamonds will still spawn in treasure chests)

+ [M] Diamond can be crafted in Alloy Furnace from 2 diamond ores (recipe learned on picking up the diamond ore, was 4 diamond ores in EK and removed entirely in UG)

+ [R] Stone Axe, Stone Pickaxe and Stone Hoe can be crafted at Crafting Table. Note that Stone Pickaxe cannot be repaired.

+ [N] Emerald Ore will spawn in previously unvisited worlds with the same conditions as Diamond Ore, including the Rock Deposites and treasure chests

+ [N] Emerald can be crafted from 2 Emerald Ore in Alloy Furnace

+ [N] Emerald Glass can be crafted from 2 Fine Sand (or Sand) blocks and 1 Emerald Ore in Alloy Furnace (material id: 8764)

+ [N] Emerald Block can be crafted from 2 Emeralds (or 4 Emerald Ore) in Crafting Table (material id: 8766)

+ [N] Emerald Drill and Emerald Pickaxe can be crafted from Emeralds in Metalwork Station and the Replicator (Sci-Fi Anvil)

+ [R] Glass Block can be crafted from 3 Sand Blocks (was removed in PG)

+ [N] Dread Block can be crafted from 2 Dreadwing Wreckage (material id: 8767)

+ [N] Hi-tech Drill and Hi-tech Pickaxe can be crafted from Dreadful Blocks in Metalwork Station and the Replicator (Sci-Fi Anvil)

+ [R] Restored pickaxe crafting recipes

+ [R] All pickaxes (except Stone Pickaxe) and drills have EK's durability values (which means they won't break so fast), block radius, tile damage and material costs (except pixel requirements):
 - Copper Drill     (d: 1000 -> 3000, b: 2 -> 3, d: 1.5 -> 2.9)
 - Silver Drill     (d: 1000 -> 3500, b: 2 -> 3, d: 2.0 -> 3.1)
 - Golden Drill     (d: 1000 -> 4000, b: 2 -> 3, d: 2.5 -> 3.3)
 - Diamond Drill    (d: 1000 -> 4500, b: 2 -> 3, d: 3.5 -> 3.7)
 - Emerald Drill    (d: 5000, b: 3, d: 4.0)
 - Platinum Drill   (d: 1000 -> 5500, b: 2 -> 3, d: 3.0 -> 4.3)
 - Hi-tech Drill    (d: 6000, b: 4, d: 5.0)
 - Stone Pickaxe    (d: 3500, b: 3, d: 2.0, cannot be repaired)
 - Copper Pickaxe   (d:  200 -> 4000)
 - Silver Pickaxe   (d:  200 -> 4500)
 - Golden Pickaxe   (d:  200 -> 5000)
 - Diamond Pickaxe  (d:  350 -> 5500)
 - Emerald Pickaxe  (d: 6000)
 - Platinum Pickaxe (d: 200 -> 6500)
 - Hi-tech Pickaxe  (d: 9001, b: 4, d: 4.2)

+ [R] Drills and pickaxes can be repaired with bars, ore and diamonds (open your inventory, equip tool, select ore/bar/diamond and right-click on the tool icon)

+ [R] Restored unique look for Wire Tool and Paint Tool

+ [N] Chainsaw can be crafted via Metalwork Station for 6 Durasteel Bar and 12 Steel Bar

+ [N] Core fragment ore can be crafted in Alloy Furnace from 10 Lava and 1 Oil (recipe learned on picking the Lava)

+ [N] Molten Core can be crafted from 2 iron bars and 10 core fragments (the recipe added to stone furnace upon pickup, originally was dropped by UFO boss in EK)

+ [R] Metalwork station requires 1 Molten Core to craft (same as in EK)

+ [N] Portable 3D Printer can be crafted at Research Station for 2000 pixels, 10 durasteel bars and 2 diamonds in 7 racial designs (was removed in UG)

+ [M] Added Old Stone Furnace and Old Alloy Furnace (unlike the UG's workbench-based versions, these are container-based and significantly cheaper)

+ [R] Coal can be crafted from 10 Unrefined Wood in Stone Furnace (recipe learned on picking up the Wood)

+ [N] Erchius Crystal can be crafted from 8 Liquid Erchius Fuel and 1 Diamond in Alloy Furnace (recipe learned on picking up the Erchius Fuel)

+ [N] Core fragment gives 10 points of fuel (seriously, what that pile of blasted glowing stones is even good for?!)

+ [N] Erchius Crystal gives 10 points of fuel (same as above)

+ [N] Oil gives 1 point of fuel (it's flammable IRL, so why not?)

+ [N] Lava gives 1 point of fuel (because it's basically the source of core fragments)

+ [R] Coal gives 2 points of fuel (same as in EK, 0 in UG)

+ [N] Teleporter Core can be crafted from 2 Iron Bars and 3 Diamonds

+ [M] All vanilla teleporters from "2-Stop Teleshop" can be crafted via Iron Crafting Table. Each requires 1 Teleporter Core and 1 Circuit board to craft (also, all of them can be safely placed and removed without object's destruction. Also included proper descriptions for each teleporter type). Other requirements vary:

 - Executive  : 3 Diamonds, 6 Durasteel Bars and 6 Glass Blocks
 - Brass      : 2 Diamonds, 10 Liquid Oil, 5 Copper Bars and 4 Glass Blocks
 - Futuristic : 2 Diamonds, 6 Silver Bars and 6 Glass Blocks
 - Scientific : 5 Steel Bars, 5 Durasteel Bars and 2 Glass Blocks
 - Stone      : 25 Cobblestone and 2 Glass Blocks
 - Tomb       : 10 Golden Bars, 4 Rubium Ore and 2 Glass Blocks
 - Wooden     : 1 Diamond, 50 Wood Planks, 3 Steel Bars and 2 Glass Blocks

+ [N] Orange Teleporter Core can be crafted from 2 Iron Bars, 4 Core Fragment Ores and 1 Diamond

+ [N] Added Portable Teleporter object. Can be crafted via Iron Crafting Table for 1 Orange Teleporter Core, 1 Circuit Board, 2 Durasteel Bars and 2 Glass Blocks

+ [M] Instant teleportation! Removed fullscreen teleport animation (causes epilepsy and slows down the game. Chucklefish, what were you thinking?!)

+ [M] Replaced teleport effect sprites with blue versions based on original Rho's design

+ [R] The player will start from forest planet (same as in EK, was "Garden" in UG). This largely increases variety in comparison with bland "Lush / Garden" worlds

+ [F] The starter planet lookup values are 5/100 (same as in EK, was 100/300 in UG). Also removed requirement for "Ancient Gateway" dungeon world, since it's always generated in every planetary system. Also removed requirement for "small" world type. This makes the first run universe generation to only take 2 minutes instead of 15(!!) on my machine

+ [M] Intraspace travel takes 5 points of fuel (was 50 in EK, 0 in UG made little to no sense, but...)

+ [F] Fixed inability to fuel your ship for vanilla races when starting a new game (required because intraspace travels are not free anymore)

+ [M] Interspace travel takes 300 points maximum (was 200 in EK and up to 1000 in UG, which is unreal and would leave you with depleted engine. This seems to be the reason (beside the coal not being a "fuel" anymore) why intraspace travel was made cost free in UG, otherwise you'd stuck forever if landed on anything but the Moon or Outpost planet)

+ [N] Limit for items per cell changed to 9999 (was 1000 in EK/UG. Everybody wants to be super greedy sometimes :3 )

+ [N] Removed 1000 items limit for Rope

+ [R] Butterfly Boost tech is available upon upgrading ship to Tier 4 (aka Sparrow Class. Requires quest data purge or playing as new character)

+ [M] Un-nerfed Morph Ball tech. It consumes 20 points of energy (was 35 in EK and 65 in UG)

+ [R] Iron Beacon is available for crafting. As a result, the Penguin UFO boss can be summoned in open space (moved to its own quest location in UG)

+ [R] Quest "CLeF Tutorial #9.1.1: The First Contact". Automatically assigned upon crafting or picking up the Old Distress Beacon. Reward: 11-900 pixels

+ [M] Dreadwing Codex matches the old-new progression. Also, the boss will drop 5 Molten Core, 21 Core Fragment Ore and 1 Dreadwing Codex

+ [N] Quest "Wreckage of the Dreadwing". Automatically assigned upon picking up the Dreadwing's Wreckage

+ [M] Upon completing the "Dreadwing" quest, penguin will give 50 Matter Item, which can be used to craft Bonus Armour (otherwise the material for it is nowhere to be found)

+ [R] Decoy Princess is available for crafting. As a result, the Bone Dragon boss can be summoned (disabled in UG)

+ [N] Added decorative Decoy Princess Scheme object. Given by "Mute" Glitch upon starting "Bad To The Bone" quest

+ [N] Quest "Bad To The Bone". Given by "Mute" Glitch at Outpost for players with Tier 5 ship

+ [R] Peanut Butter Trap is available for crafting. As a result, the Jelly boss can be summoned (disabled in SG)

+ [N] Quest "Food For Thought". Given by Apex Scientist at Outpost for players with Tier 3 ship

+ [N] Farmable Peanut Seeds can be planted and will drop Peanut Seed or Peanuts

+ [N] Wild Peanut Seeds will spawn in Garden and Forest biomes on the previously unvisited worlds

+ [N] Consumable Peanuts can be grown with farmable Peanut Seeds

+ [N] Butter can be crafted from Coconut Milk

+ [N] Peanut Butter can be crafted from Butter and Peanuts

+ [N] (Large) Cardboard Box can be crafted from (88) 42 Paper sheets

+ [N] Peanut Butter Trap can be crafted from 1 Peanut Butter, 1 Large Cardboard Box and 1 Wood

+ [N] Questline "Fatal Circuit". Given by Mercenary Glitch and Penguin Promoter at Outpost for players with Tier 3 ship

+ [R] Brain extractor and all robot parts are available for crafting. As a result, you can summon Fatal Circuit, the old robot boss (was removed in UG and replaced by Penguin Bot)

+ [N] Fatal Circuit drops quest item - shorted out Broken Fatal Claw dagger with weak stats

+ [N] Cooking recipe "Brain Stew". Cooked from Wheat, Pearlpea, Corn and Inferior Brain

+ [N] Cooking recipe "Brain Pie. Cooked from Mashed Potato, Inferior Brain and Superior Brain

+ [N] Decorative "Monster's Brain in a Jar" item can be crafted from 1 Inferior Brain, 1 Glass Block and 1 Iron Bar at Crafting Table (recipe learned upon picking up Inferior Brain)

+ [N] Power Loom, a modern replacement for Spinning Wheel, can be crafted in Metalwork Station for 8 Steel Bars

+ [R] Re-added 50 classic glitch head mods (existed in online chargen)

+ [R] Re-added developer clothing sets (can be crafted via Yarn Spinner):
 - Ban's set
 - Bartwe's glasses
 - George's set
 - Kyren's set
 - Molly's set
 - Rhopunzel's set
 - Tiy's set

+ [R] Re-added armour sets:
 - Slime set (requires 25 Green Slimes per item and 10-15 Fabric, recipes learned upon Green Slime pickup)
 - Lagoon set (can be bought for 7500 pixels, available from the start)
 - Diamond set (requires 19 Diamonds and 6 Durasteel Bars, crafted at Metalwork Station)
 - Copper set (requires 5-15 Copper Bars, crafted at Metalwork Station, recipes learned upon Copper Bar pickup)
 - Silver set (recipes learned upon Silver Bar pickup)
 - Golden set (recipes learned upon Gold Bar pickup)
 - Platinum set (recipes learned upon Platinum Bar pickup)
 - Matter set (aka Bonus set) (recipes learned upon Matter Item pickup)
 - Scavenger set (aka EK Human Tier 1) (recipes learned upon Iron Bar pickup)
 - Scout set (aka EK Human Tier 2) (recipes learned upon Steel Bar pickup)
 - Pioneer set (aka EK Human Tier 3) (recipes learned upon Titanium Bar pickup)
 - Retro Pioneer set (aka pre-EK Human Tier 3) (recipes learned upon Titanium Bar pickup)
 - Outrider set (aka EK Human Tier 4) (recipes learned upon Durasteel Bar pickup)
 - Vanguard set (aka EK Human Tier 5) (recipes learned upon Refined Aegisalt pickup)
 - Seeker set (aka EK Human Tier 6) (recipes learned upon Ferozium Compound pickup)
 - Wanderer set (aka EK Human Tier 7) (recipes learned upon Cerulium Compound pickup)
 - Adventurer set (aka EK Human Tier 8) (recipes learned upon Refined Violium pickup)
 - Trailblazer set (aka EK Human Tier 9) (recipes learned upon Refined Rubium pickup)
 - Universalist set (aka EK Human Tier 10) (recipes learned upon Impervium Compound pickup)

+ [R] Re-added misc clothing:
 - Terrifying Wings (requires 16 Fabric, 4 Rubium Ore and 2 Iron Bars, available from the start)

+ [F] Slime armour can be spawned in different colours

+ [M] Slime furniture recipes auto-learned upon Green Slime pickup

+ [F] Fixed learning of recipe for Ice Block on Ice pickup

+ [N] Ice furniture recipes auto-learned on Ice Block pickup

+ [R] Sandstone Bricks and furniture can be crafted via Iron Crafting Table (recipes auto-learned on Sandstone Block pickup) (removed from PG):
 - Sandstone Bricks
 - Sandstone Bed
 - Sandstone Chair
 - Sandstone Chest
 - Sandstone Door
 - Sandstone Table
 - Sandstone Torch (x4)

+ [M] Mole and Frog merchant objects have proper icons and breakable. Also, both have Novakid lines, and the Mole has proper descriptions

+ [M] Converting pixels to voxels and back no longer results in 40% of value loss

+ [M] Merchant buy/sell ratios changed to 90%/110% (was 20%/100% in PG)

+ [R] Planets now spawn in six sizes (partially restored from EK):
 - Tiny (2000 x 1500)
 - Small (3000 x 2000)
 - Medium (4000 x 3000)
 - Large (6000 x 4000)
 - Massive (8000 x 6000)
 - Giant (16000 x 8000)

+ [M] Changed biome type spawning for planets:
 - Tier 1 : Desert, Forest, Garden
 - Tier 2 : Desert, Forest, Moon, Ocean, Savannah, Snow
 - Tier 3 : Alien, Jungle, Ocean, Toxic, Savanna, Snow
 - Tier 4 : Alien, Arctic, Midnight*, Jingle, Moon, Toxic, Tundra
 - Tier 5 : Arctic, Magma, Midnight*, Scorched, Tundra, Volcanic
 - Tier 6 : Magma, Moon, Scorched, Volcanic
 - Bog Moon : Desert, Forest, Moon, Savannah, Snow

* - Nightly only

+ [M] The following satellite levels will spawn moon biome:
 - Tier 2
 - Tier 4
 - Tier 6

+ [M] The following planet types will spawn up to 2 moons:
 - Barren
 - Moon

+ [M] Changed dungeon spawn rates. Now the chances are following:
 - Moon (0 - 3)*
 - Garden (0 - 3)*
 - Alien (0 - 6)
 - Arctic (0 - 6)
 - Desert (0 - 6)
 - Forest (0 - 6)
 - Jungle (0 - 6)
 - Magma (0 - 6)
 - Savannah (0 - 6)
 - Scorched (0 - 6)
 - Snow (0 - 6)
 - Toxic (0 - 6)
 - Tundra (0 - 6)
 - Volcanic (0 - 6)

* - not affected by "planet type" additional values

Values for world size (added on top of the previous):
 - Tiny (0 - 1)
 - Small (0 - 1)
 - Medium (0 - 3)
 - Large (0 - 8)
 - Massive (0 - 9)
 - Giant (0 - 18)
 
+ [M] Changed planet gravity spawn rates. Now the chances are following:
 - Tiny (30 - 40)
 - Small (40 - 60)
 - Medium (60 - 80)
 - Large (80 - 100)
 - Massive (100 - 110)
 - Giant (110 - 130)
 
+ [M] Changed planet daytime length range to 500-2000 (was 700-1000 in PG)

+ [F] Reduced lag at the Outpost:
 - Patched animation and script delta values of NPCs and objects to higher delay values
 - Removed extra light effects from hanging lights and arcade machine
 - Forced monitors to be turned off by default

+ [R] Infinity Express, Penguin Bay, Sign Store, Sign Dispenser, Terramart and Treasured Trophies can be taken and printed for pixels

+ [R] Mining Drill Console, Mining Drill Machine, Water Drop Source, Acid Drop Source, Escape Radar Dish, Mining Power Sign, No Way Out Graffiti, Decorative Root Set, Secret Symbol Set, The Way Is blocked Graffiti and Turn Back Graffiti can be taken and printed for pixels

+ [R] Vending Machine can be used as 32-slot storage container (was 16-slot storage in EK)

+ [N] Water Cooler can be used as 16-slot storage container

+ [N] Outpost Water Cooler can be used as 9-slot storage container

+ [N] Water and Healing water will spawn in Water Cooler and Outpost Water cooler in previously unvisited worlds

+ [M] Rice requires to be submerged in water for at least 0.5 of block (2.0 max) to grow properly and no longer consumes wetness from soil

+ [M] All types of trees will drop at least two saplings

+ [R] Removed water consumption directional restrictions for tilled dirt (all hail hydroponics!)

+ [N] Dry tilled dirt can be watered with Alien Juice, Healing Water and Swamp Water

+ [R] Poop can be scanned and printed

+ [N] Poop and Sewage can be crafted barehanded for 1 pixel

+ [M] Removed protection from randomly generated dungeons. Explaination: they weren't designed to use shields in the first place, and lots of players has already experienced problems with being unable to even access their front entrances, "thanks" to randomly generated ground obstacles, which also went under protection of the shield

+ [M] In order to compensate the protection removal, Tesla Spikes now have 20 points of "health" and much harder to harvest as a result

+ [R] Ancient objects (such as death traps and challenge doors) will no longer break nor disappear on picking up

+ [R] Restored Outpost microdungeons spawning on all planets

+ [N] Moon biome surface spawns:
 - Expanded mini-outpost bunker
 - Restored and optimized Apex Sci-Fi Dungeon
 - Unfinished Wreck dungeon

+ [N] Moon biome underground spawns:
 - Outpost microdungeons
 - USCM microdungeons
 - Asteroid field microdungeons

+ [M] Flare and Glowstick projectiles no longer disappear when hitting monsters or spikes

+ [M] Standing Turret can be safely placed and removed without object's destruction

+ [R] Unused vanilla weapons added to treasure pools:
 - Burst Rifle
 - Cellzapper
 - Globe Launcher
 - Shattergun
 - Stinger Gun

+ [R] NPC Spawner (aka Employer) Station can be crafted via Research Station for 20 Platinum Bars (same as in EK/UG)

+ [R] Restored all NPC spawners along with Spawner Station. Each spawner requires 20 Steel Bars (same as in EK/UG):
 - Apex
 - Avian
 - Floran
 - Glitch
 - Human
 - Hylotl
 - Chef (Random)
 - Doctor (Random)
 - Guard (Random)
 - Pirate (Random)
 - Stimpack trader (Random)
 - Tools trader (Random)
 - Wizard trader (Random)

+ [M] Changed monster_surprise sound effect for randomly generated monsters to:
 - Small Biped - angstyhead_small_turnhostile.wav
 - Small Quadruped - teethyhead_small_turnhostile.wav
 - Large Biped - powlhead_turnhostile.wav
 - Large Quadruped - angstyhead_turnhostile.wav
 - Huge Biped - dragonboss_death.wav
 - Miniboss Biped - arrowhead_turnhostile.wav
 - Miniboss Quadruped - canine_turnhostile.wav

+ [M] Reworked initial S.A.I.L. dialogues to look more credible and humorous:
 - Apex - Windows 8
 - Avian - Zork
 - Floran - DOS variation
 - Glitch - parodies Linux
 - Human - Windows NT 5.x
 - Hylotl - Commodore 64
 - Novakid - PFUDOR

+ [R] Window borders are colourless again

+ [M] Navigation sub-window texture changed to blue (was light-blue in EK)

+ [N] More zoom levels (from 1.0 to 10, with 0.5 step) and screen resolutions:
 - 640 x 480
 - 800 x 600
 - 1024 x 576
 - 1360 x 768
 - 3200 x 1080
 - 3200 x 1200
 - 3200 x 1536
 - 3840 x 1080
 - 3840 x 1200
 - 3840 x 1536
 - 4096 x 2160

+ [F] Performance patch: added optimized Hobo true-type font (58 KiB and ~50000 points versus 86 Kib and ~90000 points) with fixed cyrillic characters (officially part of the game since Spirited Giraffe builds)

+ [M] Replaced Chucklefish icon and logo animation with recoloured & shaded version (also fixed "u" which strongly resembled "v")

+ [M] All tutorial quests replaced with new descriptive ones which better match the mod's progression and cover the most of its important changes. Old tutorial questline is no longer used nor called


Nightly addon
-------------

+ [M] Changed dungeon spawn rates of the newly introduced biomes:
 - Midnight (0 - 6)


Extra (Enhanced Storage) addon
------------------------------

Compatible with "Enhanced Storage". Changes the following things:

+ [N] Added "Enhanced Storage" functionality for:
 - Cardboard Box
 - Large Cardboard Box
 - Human Vending Machine
 - Human Water Cooler
 - Outpost Water Cooler
 - Outpost Tank

+ [M] De-coloured interface of extra-sized storage containers


Extra (No Enhanced Storage) addon
---------------------------------

Incompatible with "Enhanced Storage". Changes the following things:

+ [M] Glitch Bucket can be used as 9-slot storage container

+ [M] Metal, Radioactive, Sewage and Toxic Waste barrels can be used as 12-slot storage containers

+ [M] Glitch Juice Keg can be used as 24-slot storage containers

+ [M] Apex Blood Bank, Sewer Tank and Outpost Tank can be used as 48-slot storage containers


Sandbox addon
-------------

+ [R] Wet tilled dirt no longer gets dry (dry dirt still needs to be watered at least once to turn into wet dirt)

+ [R] Restored auto-learning for the following materials:

 - Silver Bar
 - Golden Bar
 - Platinum Bar
 - Titanium Bar
 - Plutonium Rod
 - Refined Rubium
 - Refined Aegisalt
 - Refined Violium
 - Ferozium Compound
 - Impervium Compound
 - Cerulium Compound

+ [R] Restored auto-learning for the following items:

 - Flare

+ [M] Removed protection from all mission-generated (and outpost) dungeons

+ [M] Removed pixel and ore drops on "Casual" and "Normal" in order to compensate the removal of auto-return to ship on "Save & Quit"

+ [N] Extra zoom levels (from 0.5 to 1, with 0.1 step)

+ [R] No slowdown when running backwards (just like in EK)

+ [R] Removed "nude" and re-added "invisible" status effect for tent objects (as a side-effect, they no longer show bugged lit sprite which sometimes was floating in the air when player got up. Same as in EK)

+ [N] Limit for items per cell changed to 99999

+ [M] Modified Hobo Lesser font with more compact number glyphs, in order to properly display more than 9999 items per cell

+ [N] Block radius for placing changed to 4 (was 2 in EK/xG)

+ [M] Removed 1 maxStack limit for:
 - Axes (Stone, Ice)
 - Hoes (Copper, Stone)
 - Pickaxes (Stone, Copper, Silver, Golden, Diamond, Emerald, Platinum, Hi-Tech)
 - Drills (Stone, Copper, Silver, Golden, Diamond, Emerald, Platinum, Hi-Tech)
 - Flashlight (Normal, Green, Red, Yellow)
 - Mining Lantern
 - Slime Hand Grapple
 - Grappling Hook
 - Swinging Vine
 - Chainsaw
 - Bug Net

+ [R] Removed fine sand spawning for sandstorm weather particles


Custom race patch
-----------------

Most of these were patched due to high userbase demand. The following races are currently supported:
 - Avali*
 - Avikan
 - Kineptic
 - Mousqutaire

Races that DON'T need patching (they use vanilla fuel hatch objects. This may change if their authors decide to make unique objects. If this will happen, please let me know so I could patch them as well):
 - Celestar
 - Familiar*
 - Kemono
 - Ningen
 - (The Pony Modpack) Alicorn
 - (The Pony Modpack) Changeling
 - (The Pony Modpack) Earth Pony
 - (The Pony Modpack) Pegasus
 - (The Pony Modpack) Ponex
 - (The Pony Modpack) Unicorn
 - Viera

Races that DON'T need patching (because either removed broken fuel hatch from Tier 2 ship or never had it in the first place. Either way, kudos to their authors! ^u^):
 - Felins
 - Kirhos
 - Munari
 - Neko
 - Orcana
 - Peglaci
 - (Super /sbg/) Barometta
 - (Super /sbg/) Beldehor
 - (Super /sbg/) Carodonts
 - (Super /sbg/) Gamayun
 - (Super /sbg/) Ichthysians
 - (Super /sbg/) Singularnosti
 - (Super /sbg/) Slimes
 - Vespoids!

If you want to use another race together with CLeF, please let me know. Though, it might be a better idea to ask their authors to integrate this single-pixel fix into their race mods rather than forcing me to add new races to this patch, because it is a tedious task to keep it up-to-date and not to break custom race ships as a result.

* - their authors/maintainers either refused to collaborate with me or were hostile towards CLeF up to eleven. So please be careful when stating that you are using this mod together with theirs.