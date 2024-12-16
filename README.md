# Second Quarter Template
Description - Travel through the seas as you explore multiple islands. On your journey you will encounter new enemies and friends. Upgrade your ship as you face more powerful enemies. Find weapons and guns to deal more damage to your foes. Do whatever it takes to be the best pirate on the 7 seas.

### Gameplay Features to Be Graded (Max 8)
* Movement and Collision (Hugo) - The player is able to move around the map. The additional type of movement is sailing in the boat. There are also different types of layers and masks that enable collisions. The player can't go in the water, but the boat can. There is differnt layers for environment, player, water, ground, props, etc.
* Enemies and Traps (Jamion) - There is one bat that has 20 health and does 5 damage.
* Tilemaps and Worldbuilding (Logan) - There are two different tilesets, one is for props like trees and bridges, and the other is the actual water and ground tiles. The three areas are the starter island, the bigger island, and the ocean.
* Combat (Hugo) - The player has two different combat options, slicing with sword, shooting gun, and cannon ball from the boat.
* NPC (Hugo) - There are 3 npcs with a reusable framwork. I can extend a class and just change the dialogue. Everything else is the same.
* Inventory - There is a currency system. You can collect coins by fighting enemies. You can also open an inventory.
* Game Save (Hugo) - There is loading system and saving system that can be accesed at the start of the game and in game.
* GUI (Bryce) - There is a health bar for both the player and the ship. On the left there is a action bar stating all the actions that can be made. There is a pause menu that lets use save and load the game. There is a mini map on the bottom right corner which shows the area.

### Examples/Locations of Implemented Features for Grading
* Inheritance - Different types of boats (check ships scenes folder) and enemies
* Encapsulation - hidden values like speed and health in player scene
* Polymorphism - It is used when checking collisions between enemies and the player. It checks to make sure if the body is a player or an enemy.
* Abstraction - not sure
* Godot Features
	* Node Types - There is a variety of node types like animated sprites, area2d, collisionshapes, viewports, etc.
	* Signals - Signals are used to check for collision of the hitboxes as well as attackbox. 
	* Scenes - Almost everything in the game scene is made up of other scenes.
	* Custom Signals - custom signals are used to load game files in the game menu scene and to open and close inventory in 
	* Resources - resources are used to save the data for the game (savegame1-3.cfg)
 * Movement and Collisions - To test it, when you are the player you can walk on the ground and can't go through trees, but when you switch to the boat you can't go on land.
 * Enemies and Traps - When you are on the starter island you will encounter bats that you can fight.
 * Combat - You start with the sword to fight enemies and you can switch to the gun. The boat also has a cannon ball. To test it you can just left click to attack.
 * Tilemaps and Worldbuilding - In the game there are two islands along with the ocean.
 * NPC - There are two npcs on the starter island and another one on the main island.
 * Inventory - To test it, press "I" when you are in the game to open and close the inventory.
 * Game Save - When you click play on the titlescreen, you can choose between 3 load files. When you are in the game, you can press "escape" to save and quit or load another game file.
 * GUI - When you are in the game there are a variety of things on the screen indicating different things.
