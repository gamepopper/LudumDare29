package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import openfl.Assets;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var bgSky:FlxSprite; //Background stuff.
	private var bgRailStation:FlxSprite;
	private var bgUndergoundTile:FlxGroup;
	
	private var bgDarkness:FlxSprite;
	
	private var _player:FlxSprite; //Player to control
	private var _playerHammer:FlxSprite; //Player to control
	
	private var _ladder:FlxGroup; //Possible ladder for player to climb up/down
	private var _bridge:FlxTilemap; //Bridge for people above to walk over.
	
	private var _people:FlxGroup; //People who walk above
	private var _rats:FlxGroup; //Rats who live below, damage fusebox and need to be killed.
	
	private var _fuseBox:ReparingSprite; //Fusebox to power the underground station, all lights go out undergound if fails.
	private var _catwalkA:ReparingSprite; //Two Catwalks for people to walk over. If broken that cannot cross the street.
	private var _catwalkB:ReparingSprite;
	
	private var _fuseBoxHealth:FlxSprite; //Health bars for Fusebox and Catwalks
	private var _catwalkAHealth:FlxSprite;
	private var _catwalkBHealth:FlxSprite;
	
	private var lightA:FlxSprite; //Lights for underground station
	private var lightB:FlxSprite;
	
	private var catwalkAHealth:FlxText;
	private var catwalkBHealth:FlxText;
	private var fuseBoxHealth:FlxText;
	
	private var hammerTime:Float = 2.1;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		Reg.complaintsAbove = Reg.complaintsBelow = Reg.score = 0;
		
		bgSky = new FlxSprite();
		bgSky.makeGraphic(FlxG.width, 200, FlxColor.CYAN);
		add(bgSky);
		
		bgRailStation = new FlxSprite(0, 600);
		bgRailStation.makeGraphic(FlxG.width, 200, 0xff332E26);
		add(bgRailStation);
		
		bgUndergoundTile = new FlxGroup();
		var bgTile = new FlxSprite(0, 0, "assets/images/UndergroundTile.png");
		bgTile.solid = false;
		
		for (xTile in 0 ... 32)
		{
			for (yTile in 0 ... 3)
			{
				var tempTile = new FlxSprite(xTile * 40, 600 + (yTile * 40));
				tempTile.loadGraphicFromSprite(bgTile);
				tempTile.solid = false;
				bgUndergoundTile.add(tempTile);
			}
		}
		add(bgUndergoundTile);
		
		lightA = new FlxSprite(360 - 400, 600, "assets/images/Lights.png");
		lightB = new FlxSprite(360 + 400, 600, "assets/images/Lights.png");
		add(lightA);
		add(lightB);
		
		_bridge = new FlxTilemap();
		_bridge.loadMap(Assets.getText("assets/data/Level.txt"), "assets/images/BridgeTiles.png", 40, 40, 0, 1);
		add(_bridge);
		
		_ladder = new FlxGroup();		
		createLadder();
		add(_ladder);
		
		_people = new FlxGroup();
		add(_people);
		_rats = new FlxGroup();
		add(_rats);
		
		_fuseBox = new ReparingSprite();
		_fuseBox.setPosition(880, 520);
		_fuseBox.loadGraphic("assets/images/FuseBox.png");
		_fuseBox.health = 100;
		_fuseBox.MaxHealth = 100;
		add(_fuseBox);
		
		_fuseBoxHealth = new FlxSprite(_fuseBox.x - 20, _fuseBox.y - 15);
		_fuseBoxHealth.makeGraphic(100, 10, FlxColor.GREEN);
		add(_fuseBoxHealth);
		
		_catwalkA = new ReparingSprite();
		_catwalkA.setPosition(200, 200);
		_catwalkA.loadGraphic("assets/images/CatWalk.png", true, 120, 120);
		_catwalkA.animation.add("Stable", [0], 0, false);
		_catwalkA.animation.add("Unstable", [1], 0, false);
		_catwalkA.health = 50;
		_catwalkA.MaxHealth = 50;
		_catwalkA.immovable = true;
		add(_catwalkA);
		
		_catwalkAHealth = new FlxSprite(_catwalkA.x + 10, _catwalkA.y + 20);
		_catwalkAHealth.makeGraphic(100, 10, FlxColor.GREEN);
		add(_catwalkAHealth);
		
		_catwalkB = new ReparingSprite();
		_catwalkB.setPosition(960, 200);
		_catwalkB.loadGraphicFromSprite(_catwalkA);
		_catwalkB.health = 50;
		_catwalkB.MaxHealth = 50;
		_catwalkB.immovable = true;
		add(_catwalkB);
		
		_catwalkBHealth = new FlxSprite(_catwalkB.x + 10, _catwalkB.y + 20);
		_catwalkBHealth.makeGraphic(100, 10, FlxColor.GREEN);
		add(_catwalkBHealth);
		
		_playerHammer = new FlxSprite(0, 0);
		_playerHammer.loadGraphic("assets/images/HammerHand.png", true, 30, 60);
		_playerHammer.animation.add("Loop", [0, 1], 4);
		_playerHammer.animation.play("Loop");
		add(_playerHammer);
		
		_player = new FlxSprite(440, 240);
		_player.loadGraphic("assets/images/PlayerSheet.png", true, 40, 80);
		_player.animation.add("Stand", [0], 0, false);
		_player.animation.add("Walk", [1, 0, 2, 0], 4);
		_player.animation.add("Climb", [5, 4, 6, 4], 4);
		_player.animation.add("Fall", [0, 3], 2, false);
		add(_player);
		
		bgDarkness = new FlxSprite(0, 200);
		bgDarkness.makeGraphic(FlxG.width, 400, 0x99000000);
		add(bgDarkness);
		
		catwalkAHealth = new FlxText(10, 10, FlxG.width);
		add(catwalkAHealth);
		catwalkBHealth = new FlxText(10, 20, FlxG.width);
		add(catwalkBHealth);
		fuseBoxHealth = new FlxText(10, 30, FlxG.width);
		add(fuseBoxHealth);
		
		FlxG.mouse.visible = false;
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		bgDarkness = null;
		bgRailStation = null;
		bgSky = null;
		_player = null;
		_ladder = null;
		_bridge = null;
		_people = null;
		_rats = null;
		_fuseBox = null;
		
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		updatePlayer();
		
		hammerTime += FlxG.elapsed;
		_playerHammer.visible = (hammerTime < 1);
		
		if (FlxG.keys.anyJustReleased(["R"]))
		{
			createRat();
		}
		
		if (FlxG.keys.anyJustReleased(["P"]))
		{
			createPerson();
		}
		
		if (FlxG.keys.anyJustReleased(["D"]))
		{
			_fuseBox.health = 0;
		}
		
		_rats.forEachOfType(RatObject, ifRatOutside);
		_people.forEachOfType(FlxSprite, ifPersonOutside);
		//FlxG.camera.shake(0.03, 0.5);
		
		_catwalkAHealth.scale.x = (_catwalkA.health / 50);
		_catwalkBHealth.scale.x = (_catwalkB.health / 50);
		_fuseBoxHealth.scale.x = (_fuseBox.health / 100);
		
		if (_catwalkA.health <= 0) _catwalkA.animation.play("Unstable");
		else _catwalkA.animation.play("Stable");
		
		if (_catwalkB.health <= 0) _catwalkB.animation.play("Unstable");
		else _catwalkB.animation.play("Stable");
		
		lightA.visible = (_fuseBox.health > 0);
		lightB.visible = (_fuseBox.health > 0);
		bgDarkness.visible = (_fuseBox.health <= 0);
		
		updateCollisions();
		
		catwalkAHealth.text = "Health: " + _catwalkA.health;
		catwalkBHealth.text = "Health: " + _catwalkB.health;
		fuseBoxHealth.text = "Health: " + _fuseBox.health;
		
		super.update();
	}
	
	private function createLadder():Void
	{
		for (xTile in 0 ... _bridge.widthInTiles)
		{
			for (yTile in 0 ... _bridge.heightInTiles)
			{
				if (_bridge.getTile(xTile, yTile) == 3)
				{
					var tempLadder = new FlxSprite(xTile * 40, yTile * 40);
					tempLadder.loadGraphic("assets/images/Ladder.png");
					_ladder.add(tempLadder);
					
					_bridge.setTile(xTile, yTile, 0);
				}
			}
		}
	}
	
	private function createRat():Void
	{
		var tempRat:RatObject = new RatObject(0, 540);
		
		_rats.add(tempRat);
	}
	
	private function createPerson():Void
	{
		var tempPerson:PersonObject = new PersonObject(0, 120);
		tempPerson.velocity.x = 50 + (Math.random() * 100);
		tempPerson.acceleration.y = 200;
		
		if (Math.random() < 0.5)
		{
			tempPerson.x = FlxG.width - 40;
			tempPerson.flipX = true;
			tempPerson.velocity.x = -(50 + (Math.random() * 100));
		}
		
		var spriteColour:Float = Math.random();
		if (spriteColour < 0.2)
			tempPerson.loadGraphic("assets/images/Person1.png", true, 40, 80);
		else if (spriteColour < 0.4)
			tempPerson.loadGraphic("assets/images/Person2.png", true, 40, 80);
		else if (spriteColour < 0.6)
			tempPerson.loadGraphic("assets/images/Person3.png", true, 40, 80);
		else if (spriteColour < 0.8)
			tempPerson.loadGraphic("assets/images/Person4.png", true, 40, 80);
		else
			tempPerson.loadGraphic("assets/images/Person5.png", true, 40, 80);
				
		tempPerson.animation.add("Walk", [1, 0, 2, 0], 4);
		tempPerson.animation.play("Walk");
		
		_people.add(tempPerson);
	}
	
	private function climb(ladder:FlxObject, player:FlxSprite):Void
	{
		player.velocity.y = 0;
		
		if (FlxG.keys.anyPressed(["UP", "W"]))
		{
			player.x = ladder.x;
			player.velocity.y = -150;
			
			player.animation.play("Climb");
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"]))
		{
			player.x = ladder.x;
			player.velocity.y = 150;
			player.animation.play("Climb");
		}
	}
	
	private function playerVrat(player:FlxObject, rat:FlxObject):Void
	{
		if (_playerHammer.visible)
			rat.kill();
	}
	
	private function ifRatOutside(Rat:RatObject):Void
	{
		if (Rat.x < 0 || Rat.x + Rat.width > FlxG.width)
		{
			TurnAround(Rat);
		}
		
		if (Rat.alpha <= 0)
		{
			Rat.exists = false;
		}
		
		if (!FlxG.overlap(Rat, _fuseBox))
		{
			Rat.touchedObject = false;
		}
	}
	
	private function ratVfuse(Rat:RatObject, Fuse:FlxObject)
	{
		if (Rat.touchedObject == false)
		{
			Fuse.health--;
			Rat.touchedObject = true;
		}
	}
	
	private function ifPersonOutside(Person:FlxSprite):Void
	{
		if (Person.x > FlxG.width || Person.x + Person.width < 0)
		{
			Person.destroy();
		}
	}
	
	private function ifPersonOnCatWalk(Person:PersonObject):Void
	{
		FlxG.collide(Person, _catwalkA);
		FlxG.collide(Person, _catwalkB);
		
		if (Person.x < _catwalkA.x + _catwalkA.width && Person.x + Person.width > _catwalkA.x)
		{
			if (_catwalkA.health <= 0)
			{
				if (Person.getMidpoint().x < _catwalkA.getMidpoint().x)
				{
					Person.x -= 2;
				}
				else
				{
					Person.x += 2;
				}
				
				TurnAround(Person);
			}
			else if (Person.steppedOn == false)
			{
				_catwalkA.health -= 2;
				Person.steppedOn = true;
			}
		}
		else if (Person.x < _catwalkB.x + _catwalkB.width && Person.x + Person.width > _catwalkB.x)
		{
			if (_catwalkB.health <= 0)
			{
				if (Person.getMidpoint().x < _catwalkB.getMidpoint().x)
				{
					Person.x -= 2;
				}
				else
				{
					Person.x += 2;
				}
				
				TurnAround(Person);
			}
			else if (Person.steppedOn == false)
			{
				_catwalkB.health -= 2;
				Person.steppedOn = true;
			}
		}
		
		if (!(Person.x < _catwalkA.x + _catwalkA.width && Person.x + Person.width > _catwalkA.x) && 
		!(Person.x < _catwalkB.x + _catwalkB.width && Person.x + Person.width > _catwalkB.x))
		{
			Person.steppedOn = false;
		}
	}
	
	private function TurnAround(Sprite:FlxSprite):Void
	{
		Sprite.velocity.x = -Sprite.velocity.x;
		Sprite.flipX = !Sprite.flipX;
	}
	
	private function fixObject(Player:FlxObject, Object:FlxObject)
	{
		if (_playerHammer.visible)
			Object.health++;
	}
	
	private function updatePlayer()
	{
		_player.velocity.x = 0;
		if (FlxG.keys.anyPressed(["LEFT", "A"]))
		{
			_player.velocity.x = -200;
			_player.flipX = true;
			_player.animation.play("Walk");
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"]))
		{
			_player.velocity.x = 200;
			_player.flipX = false;
			_player.animation.play("Walk");
		}
		
		if (FlxG.keys.anyPressed(["SPACE"]))
		{
			hammerTime = 0;
		}
		
		_playerHammer.flipX = _player.flipX;
		
		if (_playerHammer.flipX)
			_playerHammer.setPosition(_player.x - 12, _player.y + 5);
		else
			_playerHammer.setPosition(_player.x + 23, _player.y + 5);
		
	}
	
	private function updateCollisions()
	{
		if (!FlxG.collide(_player, _bridge))
		{
			_player.animation.play("Fall");
		}
		else
		{
			if (_player.velocity.x == 0)
			{
				_player.animation.play("Stand");
			}
		}
		
		if (FlxG.overlap(_ladder, _player, climb))
		{
			_player.acceleration.y = 0;
		}
		else
		{
			_player.acceleration.y = 500;
		}
		
		FlxG.overlap(_player, _rats, playerVrat);
		
		if (_catwalkA.health < 50) FlxG.overlap(_player, _catwalkA, fixObject);
		if (_catwalkB.health < 50) FlxG.overlap(_player, _catwalkB, fixObject);
		if (_fuseBox.health < 100) FlxG.overlap(_player, _fuseBox, fixObject);
		
		FlxG.collide(_people, _bridge);
		_people.forEachOfType(PersonObject, ifPersonOnCatWalk);
		
		FlxG.overlap(_rats, _fuseBox, ratVfuse);
	}
	
	
}