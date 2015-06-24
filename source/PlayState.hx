package;

import flash.media.Sound;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;

import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
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
	
	private var train:FlxSprite;
	private var trainTrigger:Bool = false;
	
	private var bgDarkness:FlxSprite;
	
	private var _player:FlxSprite; //Player to control
	private var _playerHammer:FlxSprite; //Player to control
	private var _playerClimbTrigger:Bool = false;
	private var _playerWalkSound:FlxSound;
	
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
	
	private var remainingTime:Float;
	private var timeText:FlxText;
	
	private var hammerTime:Float = 2.1;
	
	private var personTime:Float = 12;
	private var ratTime:Float = 8;
	
	private var personSpawn:Int = 0;
	private var ratSpawn:Int = 0;
	
	private var personSpawnTimer:Float = 0;
	private var ratSpawnTimer:Float = 0;
	private var eventRatTimer:Float = 0;
	private var eventPersonTimer:Float = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		Reg.complaintsAbove = Reg.complaintsBelow = Reg.total = 0;
		Reg.score = 0;
		
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
		
		train = new FlxSprite(720, 620, "assets/images/Train.png");
		train.velocity.x = 350;
		add(train);
		
		lightA = new FlxSprite(360 - 400, 600, "assets/images/Lights.png");
		lightB = new FlxSprite(360 + 400, 600, "assets/images/Lights.png");
		add(lightA);
		add(lightB);
		
		_bridge = new FlxTilemap();
		_bridge.loadMapFromCSV(Assets.getText("assets/data/Level.txt"), "assets/images/BridgeTiles.png", 40, 40, 0, 1);
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
		_player.animation.add("Walk", [1, 0, 2, 0], 8);
		_player.animation.add("Climb", [5, 4, 6, 4], 8);
		_player.animation.add("Fall", [0, 3], 10, false);
		add(_player);
		_playerWalkSound = new FlxSound();
		_playerWalkSound.loadEmbedded("Walk", true);
		
		bgDarkness = new FlxSprite(0, 200);
		bgDarkness.makeGraphic(FlxG.width, 400, 0x99000000);
		add(bgDarkness);
		
		remainingTime = 60 * 2;
		
		timeText = new FlxText(10, 10, FlxG.width, "Time Remaining: ", 36);
		timeText.color = 0xff000000;
		add(timeText);
		
		FlxG.sound.play("Streets", 1, true);
		
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
		_playerWalkSound = null;
		_playerHammer = null;
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
	override public function update(elapsed:Float):Void
	{
		updatePlayer();
		
		hammerTime += FlxG.elapsed;
		_playerHammer.visible = (hammerTime < 1);
		
		eventPersonTimer += FlxG.elapsed;
		eventRatTimer += FlxG.elapsed;
		
		if (Math.floor(eventPersonTimer) == personTime)
		{
			personSpawn = Math.ceil(Math.random() * 10);
			
			eventPersonTimer = 0;
			
			if (personTime > 3)
				personTime--;
		}
		
		if (Math.floor(eventRatTimer) == ratTime)
		{
			ratSpawn = Math.ceil(Math.random() * 5);
			
			eventRatTimer = 0;
			
			if (ratTime > 1)
				ratTime--;
		}
		
		if (ratSpawn > 0)
		{
			ratSpawnTimer += FlxG.elapsed;
		}
		
		if (ratSpawnTimer > 0.5)
		{
			createRat();
			ratSpawn--;
			ratSpawnTimer = 0;
		}
		
		if (personSpawn > 0)
		{
			personSpawnTimer += FlxG.elapsed;
		}
		
		if (personSpawnTimer > 0.3)
		{
			createPerson();
			personSpawn--;
			personSpawnTimer = 0;
		}
		
		_rats.forEachOfType(RatObject, ifRatOutside);
		_people.forEachOfType(FlxSprite, ifPersonOutside);
		
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
		
		if (remainingTime > 0)
			remainingTime -= FlxG.elapsed;
		else
		{
			remainingTime = 0;
			Reg.remainingRats = _rats.countLiving();
			FlxG.camera.fade(FlxColor.BLACK, 1, false, goToScore);
		}
		
		Reg.total += FlxG.elapsed;
		
		if (_fuseBox.health <= 0)
		{
			Reg.complaintsBelow += FlxG.elapsed;
			_fuseBox.health = 0;
		}
		
		var minutes:Int = Math.floor(remainingTime / (60));
		var seconds:Int = Math.floor(remainingTime - (minutes * 60));
		
		if (seconds < 10)
			timeText.text = "Time Remaining: " + minutes + ":0" + seconds;
		else
			timeText.text = "Time Remaining: " + minutes + ":" + seconds;
			
		if (seconds % 30 == 0 && remainingTime != 0)
		{
			if (trainTrigger == false)
			{
				FlxG.camera.shake(0.005, 6);
				FlxG.sound.play("Train", 0.4);
				train.x = -900;
				trainTrigger = true;
			}
		}
		else
		{
			trainTrigger = false;
		}
		
		updateCollisions();
		
		super.update(elapsed);
	}
	
	private function goToScore():Void
	{
		//Reg.screenShot.loadGraphicFromTexture(FlxG.camera.buffer);
		FlxG.switchState(new ScoreState());
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
		
		Reg.total++;
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
				
		tempPerson.animation.add("Walk", [1, 0, 2, 0], 8);
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
		
		if (player.animation.curAnim == player.animation.getByName("Climb"))
		{
			if ((player.animation.curAnim.curFrame == 0 ||
				player.animation.curAnim.curFrame == 2))
				{
					if (_playerClimbTrigger == false)
					{
						FlxG.sound.play("Ladder");
						_playerClimbTrigger = true;
					}
				}
				else
				{
					_playerClimbTrigger = false;
				}
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
			Fuse.health-=2;
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
				Reg.total++;
			}
			else if (Person.steppedOn == false)
			{
				_catwalkA.health -= 2;
				Person.steppedOn = true;
				Reg.total++;
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
				Reg.total++;
			}
			else if (Person.steppedOn == false)
			{
				_catwalkB.health -= 2;
				Person.steppedOn = true;
				Reg.total++;
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
			Object.health+=0.5;
	}
	
	private function updatePlayer()
	{
		_player.velocity.x = 0;
		
		if (FlxG.keys.anyJustPressed(["LEFT", "RIGHT", "A", "D"]))
		{
			_playerWalkSound.play();
		}
		
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
		
		if (FlxG.keys.anyJustPressed(["SPACE"]))
		{
			if (FlxG.overlap(_player, _catwalkA) || 
				FlxG.overlap(_player, _catwalkB) ||
				FlxG.overlap(_player, _fuseBox))
			{
				FlxG.sound.play("Hammer");
			}
			
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
		if (!FlxG.collide(_player, _bridge) && !FlxG.overlap(_ladder, _player))
		{
			if (_player.animation.curAnim != _player.animation.getByName("Fall"))
				_player.animation.play("Fall");
			
				_playerWalkSound.stop();
		}
		else
		{
			if (_player.velocity.x == 0 && !FlxG.keys.anyPressed(["RIGHT","LEFT","A","D"]))
			{
				if (_player.animation.curAnim != _player.animation.getByName("Stand"))
					_player.animation.play("Stand");
					
				_playerWalkSound.stop();
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
		
		if (_player.x < 0)
			_player.x = 0;
		else if (_player.x + _player.width > FlxG.width)
			_player.x = FlxG.width - _player.width;
		
		FlxG.overlap(_player, _rats, playerVrat);
		
		if (_catwalkA.health < 50) FlxG.overlap(_player, _catwalkA, fixObject);
		if (_catwalkB.health < 50) FlxG.overlap(_player, _catwalkB, fixObject);
		if (_fuseBox.health < 100) FlxG.overlap(_player, _fuseBox, fixObject);
		
		FlxG.collide(_people, _bridge);
		_people.forEachOfType(PersonObject, ifPersonOnCatWalk);
		
		FlxG.overlap(_rats, _fuseBox, ratVfuse);
	}
	
	
}