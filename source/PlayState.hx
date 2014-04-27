package;

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
	private var _player:FlxSprite; //Player to control
	
	private var _ladder:FlxGroup; //Possible ladder for player to climb up/down
	private var _bridge:FlxTilemap; //Bridge for people above to walk over.
	
	private var _people:FlxGroup; //People who walk above
	private var _rats:FlxGroup; //Rats who live below, damage fusebox and need to be killed.
	
	private var _fuseBox:FlxSprite; //Fusebox to power the underground station
	private var _catwalkA:FlxSprite;
	private var _catwalkB:FlxSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		Reg.complaintsAbove = Reg.complaintsBelow = Reg.score = 0;
		
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
		
		_fuseBox = new FlxSprite(880, 520);
		_fuseBox.makeGraphic(60, 40, FlxColor.NAVY_BLUE);
		add(_fuseBox);
		_catwalkA = new FlxSprite(200, 200);
		_catwalkA.makeGraphic(120, 120, FlxColor.PURPLE);
		add(_catwalkA);
		_catwalkB = new FlxSprite(960, 200);
		_catwalkB.makeGraphic(120, 120, FlxColor.PURPLE);
		add(_catwalkB);
		
		_player = new FlxSprite(440, 240);
		_player.makeGraphic(40, 80, FlxColor.PINK);
		add(_player);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
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
		_player.velocity.x = 0;
		if (FlxG.keys.anyPressed(["LEFT", "A"]))
		{
			_player.velocity.x = -200;
			_player.facing = FlxObject.LEFT;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"]))
		{
			_player.velocity.x = 200;
			_player.facing = FlxObject.RIGHT;
		}
		
		//FlxG.camera.shake(0.03, 0.5);
		super.update();
		
		FlxG.collide(_player, _bridge);
		if (FlxG.overlap(_ladder, _player, climb))
		{
			_player.acceleration.y = 0;
		}
		else
		{
			_player.acceleration.y = 500;
		}
		
		FlxG.collide(_people, _bridge);
		FlxG.collide(_people, _catwalkA);
		FlxG.collide(_people, _catwalkB);
		FlxG.collide(_rats, _bridge);
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
					tempLadder.makeGraphic(40, 40, FlxColor.GRAY);
					_ladder.add(tempLadder);
					
					_bridge.setTile(xTile, yTile, 0);
				}
			}
		}
	}
	
	private function climb(ladder:FlxObject, player:FlxObject):Void
	{
		player.velocity.y = 0;
		
		if (FlxG.keys.anyPressed(["UP", "W"]))
		{
			player.x = ladder.x;
			player.velocity.y = -150;
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"]))
		{
			player.x = ladder.x;
			player.velocity.y = 150;
		}
	}
}