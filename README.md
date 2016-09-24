# CLeF - Things To Do In Starbound
Starbound content restoration and gameplay overhaul project

Version 63 (2016/03/11) ABANDONED. FEEL FREE TO FORK THIS PROJECT
----------

/!\ CURRENTLY BROKEN. None of the current game versions work.

Last known version to work:
- [Stable] Pleased Giraffe Build 691


Installation
------------

Warning! If you have previous version installed, please delete any directories or .modpak files which match "cl*f*" pattern.

Copy the following directories into "starbound/giraffe_storage/mods/" directory:

Required:

+ CLeF - Common. Core mod files common for all supported game versions

Optional (with conditions):

+ CLeF - Custom Race Patch. Patches single object in Tier 2 ships of various custom races in order to give player access to working fuel hatch interface.

+ CLeF - Extra (CM). Compatibility bridge and features from Creative Mode mod.

+ CLeF - Extra (ES). Compatibility bridge and features from Enhanced Storage mod.

+ CLeF - Extra (No ES). Extra features that are incompatible with Enhanced Storage mod.

Optional (consult "Gameplay changes" section for details):

+ CLeF - Sandbox. Restores more sandbox gameplay, yet also removes certain restrictions (some people might find it "cheaty"). Strongly recommended for people who prefer Koala builds over Giraffe


Overview
--------

Are you looking for sandbox gameplay? You've come to the right place.

CF has severely crippled Starbound in Giraffe "updates" and removed as much that associated it with Terraria as they could. Hence, this modification was born.

CLeF is a community effort to address and revert most of unwanted changes, as well as introduce balance tweaks, enhancements and a good portion of entirely new content. ;) It also addresses the poor game's performance on relatively slow hardware and improves it.

Please take a couple of minutes to read the list of changes this mod has to offer. Also, see the full list of authors and included mods at the end of the description.


Frequently Asked Questions
--------------------------

Q: Will you add back Temperature and Hunger mechanics?

A: There are two separate mods which do this:

* http://community.playstarbound.com/resources/2953/ - Hunger & Thirst (by Image_Not_Available)

* http://community.playstarbound.com/resources/2475/ - Temperature Returns (by xxswatelitexx)

Sadly, I can't permanently add them to CLeF, because, once installed, they cannot be uninstalled without the entire savegame wipe. Also, the temperature mod have no means of displaying the required data, since the game's UI lacks of custom HUD indication support.


Q: So, I've repaired my ship and decided to move to another planet in the local system. I'm clicking "GO" and nothing happens.

A: You'll have to fuel your ship first (lava, coal, core fragment ore or even oil will do the trick). Please keep in mind the intraspace travel is no longer free. The fuel cost simply doesn't show up on Tier 2 ships (without repaired FTL drive) due to a bug.


Q: I can't access fuel hatch! My character has stuck at his starter planet! I was playing as custom race.

A: You'll need to use Custom Race Patch provided in the distribution, although it won't magically work for all races. If you want a permanent solution, please ask the author of that race to make working fuel hatch object in Tier 2 ship (I've asked some of them, and you can find their races in "Recommended mods" section).

Also, you can fix it on your own. There are two options:
* Open <racename>t2blocks.png and copy fuel hatch pixel (orange-red at the top of a blue block) from <racename>t3blocks.png. Note you'll have to delete your shipworld, otherwise the fix won't be applied (don't forget to take everything you don't want to lose with you).

OR

* Patch broken<racename>fuelhatch.object into working fuel hatch. See example of such patch in CLeF - Custom Race Patch/objects/ship/ directory.


Q: Wait, a single pixel change? Wouldn't this affect vanilla progression?

A: Yes, it is a single pixel change, which does not affect progression in any way. Even if player will have working fuel hatch, he won't be able to travel past the local solar system, because FTL drive is not working at Tier 2 ship regardless if fuel hatch is available or not.

Besides, Chucklefish might change their mind regarding the fuel and you'll be forced to make that single pixel change anyway.


Q: Is it compatible with custom ship mods?

A: As long as they don't include non-vanilla broken fuel hatch objects, yes.


Q: Okay, I beat the UFO boss. Where's the rest of the quests?

A: The rest of the quests are integrated into Outpost NPC's questlines:

* [Added in v22] Bone Dragon boss is integrated into Outpost Mute Glitch's quest line.

* [Added in v42] Jelly boss is integrated into Outpost Apex Scientist's quest line.

* [Added in v48] Fatal Circuit robot boss is integrated into Outpost Glitch Mercenary's and Penguin Promoter's quest lines.

This mod is work-in-progress. Please be patient.


Q: Will I be able to play on vanilla servers if I'll install this mod?

A: Short answer: no. Long answer: any mod which makes changes to .config files or adds new objects will not be compatible with vanilla servers.


Q: What's with the name? Are you telling us to choke the developers?

A: It's both pun and an allegory. The fish is already dead.


Help wanted
-----------

I have little to no knowledge in Lua, so this prevents me from re-implementing lots of things. I would really appreciate your help.

Also, if you've noticed another feature, object or armor that was removed by Chucklefish and want it back, please tell me immediately!


Known bugs
----------

+ The game prevents patching of .config files, hence complete replacement files are used instead. CLeF will conflict with any mods that replace them.

+ CLeF will conflict with any mods that add "learnBlueprintsOnPickup" variable to items/objects. The solution is to move the above-mentioned variable from CLeF and insert contents of variable into problematic mod's patch.


Gameplay changes
----------------

See GAMEPLAY_CHANGES.md for details.


To-do list
----------

Seamlessly integrate the old quests and boss fights back into game:

+ Restore Jelly (DONE!)

+ Restore Fatal Circuit (DONE! Needs animation definition fixes)

+ Restore Bone Dragon (DONE! Needs some path/collision fixes)

+ Restore Tentacle Comet (broken, needs Lua coding and quest scripting)

Bring back biome variety:

+ Restore all removed biomes and mini-biomes

+ Restore removed microdungeons (in progress)

+ The moons with more life and loot underneath, not just a stinky fuel (in progress)

+ Barren worlds with realistic core, undercaves and stuff

Bunch of other stuff I tend to forget...


Team
----

* dsp2003 (founder, lead developer, documentation writer)
* Djekue-kun (bonus ducks, moral support)
* LoPhatKao (Lua coding and major fixes for bosses, restored monster sound effects! ^o^)


Contributors
------------

These people has (in)directly contributed fixes and/or improvements. In alphabetical order:

* Grover Cures Houses (repairable tools flag)
* Kawa (JSON stuff, modding tips and tricks)
* Rhyssia (initial Fatal Circuit fixes, which kick-started more stuff)
* TanzNukeTerror (several improvements I was too lazy to do on my own)
* Varixai (modding tips and tricks)
* XNicoX14 (alternative repairs mechanism and inspiration ^u^)
* xxswatelitexx (JSON stuff, modding tips and tricks)


Third-party mods merged with CLeF
---------------------------------

CLeF is not a classic "modpack", as the merged mods are not simply copy-pasted, but rebalanced, rearranged and tightly integrated with the rest of the content, hence they will conflict with original mods. Use these only if you're not planning to install CLeF.

PLEASE NOTE: Installing these separately won't give you 100% functionality of CLeF - just somewhere around 15% (plus you'll have to port these to the latest game version on your own).

+ http://community.playstarbound.com/resources/22/ - Hair Mods (by Lissar)
+ http://community.playstarbound.com/resources/25/ - Kimono Mods (by Lissar)
+ http://community.playstarbound.com/resources/45/ - Modified Vanilla Hairstyles (by Team Aardvark)
+ http://community.playstarbound.com/resources/106/ - Haircut v1.3 (by patchwork536)
+ http://community.playstarbound.com/resources/309/ - Roserade foliage for Florans (by Chocodile)
+ http://community.playstarbound.com/resources/346/ - Floran Color Scheme Mix (by Annuschka)
+ http://community.playstarbound.com/resources/418/ - Beauty Blooms (by IcyOrio)
+ http://community.playstarbound.com/resources/2142/ - Emeralds! (by Serverator)
+ http://community.playstarbound.com/resources/2324/ - Classic Glitch Heads (by Darkness Wizard & Pazius)
+ http://community.playstarbound.com/resources/2498/ - More Screen Resolutions (by eurosat7)
+ http://community.playstarbound.com/resources/2502/ - More Saplings (by KateisLost)
+ http://community.playstarbound.com/resources/2633/ - Lava Fuel Mod (by XNicoX14)
+ http://community.playstarbound.com/resources/2635/ - Prepare for Glory! (by LegendXCarisso) - Removed until further notice
+ http://community.playstarbound.com/resources/2640/ - Apex Grind Again (by eurosat7)
+ http://community.playstarbound.com/resources/2644/ - Craftable Chainsaw (by XNicoX14)
+ http://community.playstarbound.com/resources/2648/ - Repair Tools (by XNicoX14)
+ http://community.playstarbound.com/resources/2696/ - Developer Clothing Sets (by Lucaine)
+ http://community.playstarbound.com/resources/2705/ - Loom (by I Said No)
+ http://community.playstarbound.com/resources/2728/ - Swamp & Lagoon Armor Returned (by Campaigner)
+ http://community.playstarbound.com/resources/2811/ - Original Pioneer Armor (by Snigery)
+ http://community.playstarbound.com/resources/2832/ - Dreadwing Block (by shardshunt)
+ http://community.playstarbound.com/resources/2927/ - Slime Armour Colours Mod (by shadowd15)
+ http://community.playstarbound.com/resources/2939/ - Discernible Titanium Ore (by MetalTxus)
+ http://community.playstarbound.com/resources/2948/ - Moar Dungeons (by G4M5T3R)
+ http://community.playstarbound.com/resources/2949/ - Outpost Lag Reduction (by LoPhatKao)
+ http://community.playstarbound.com/resources/2978/ - Screams (by LoPhatKao)
+ http://community.playstarbound.com/resources/2995/ - It's over 9000 (by SoulOfSorin)
+ http://community.playstarbound.com/resources/2999/ - Static Toy Block (by IllidanS4)
+ http://community.playstarbound.com/resources/3049/ - Platform Books (by TanzNukeTerror)
+ http://community.playstarbound.com/resources/3058/ - Portable 3D Printer (by TanzNukeTerror)
+ http://community.playstarbound.com/resources/3070/ - Paint and Wire Tool restoration (by TanzNukeTerror)
+ http://community.playstarbound.com/resources/3077/ - Reliable Flares (by Oberic)
+ http://community.playstarbound.com/resources/3079/ - Vanilla Gun Activator (by Oberic)
+ http://community.playstarbound.com/resources/3089/ - Reasonable Modules (by Artix3)
+ http://community.playstarbound.com/resources/3104/ - Poop's Revenge (by Surn_Thing)
+ http://community.playstarbound.com/resources/3107/ - ezGlass (by Lefl)
+ http://community.playstarbound.com/resources/3112/ - Lossless Voxels! (by TanzNukeTerror)
+ http://community.playstarbound.com/resources/3134/ - Aquatic Rice (by LoPhatKao)
+ http://community.playstarbound.com/resources/3183/ - Biome Treasure Pool Cleanup (by Surn_Thing)
+ http://community.playstarbound.com/resources/3210/ - No Sand Sandstorms (by lazarus78)
+ http://community.playstarbound.com/resources/3237/ - Hylotl Fake Plant Fix (by TheElderScroller)
+ http://community.playstarbound.com/resources/3262/ - Amethystumn's Floran Hair Pack (by KittyBlossom)
+ http://community.playstarbound.com/resources/3281/ - Strong Oshrooms (by Snaid1)
+ http://community.playstarbound.com/resources/3298/ - Classic Dash Tech (by Wow_Space)
+ http://community.playstarbound.com/resources/3341/ - Reed Farming (by Markelius)
+ http://community.playstarbound.com/resources/3373/ - Vanilla Boat Fixes (by LoPhatKao)
+ http://community.playstarbound.com/resources/3389/ - Airlocks! (by LoPhatKao)
+ http://community.playstarbound.com/resources/3471/ - SPACE! Pickaxes (by zickeli7 & thempiggy22)


Version history
---------------

See VERSION_HISTORY.md for details.


License
-------

This modification has been released under Creative Commons Attribution Share-Alike 4.0 International license terms.

See https://creativecommons.org/licenses/by-sa/4.0/ for details.
