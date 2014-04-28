package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import openfl.Assets;

/**
 * A FlxState which can be used for the game's menu.
 */
class InstructionsState extends FlxState
{
	private var bgSky:FlxSprite; //Background stuff.
	private var bgRailStation:FlxSprite;
	private var bgUndergoundTile:FlxGroup;
	
	private var _ladder:FlxGroup; //Possible ladder for player to climb up/down
	private var _bridge:FlxTilemap; //Bridge for people above to walk over.
	
	private var _fuseBox:ReparingSprite; //Fusebox to power the underground station, all lights go out undergound if fails.
	private var _catwalkA:ReparingSprite; //Two Catwalks for people to walk over. If broken that cannot cross the street.
	private var _catwalkB:ReparingSprite;
	
	private var lightA:FlxSprite; //Lights for underground station
	private var lightB:FlxSprite;
	
	private var clipboard:FlxSprite;
	
	private var complaintsAboveText:FlxText;
	private var complaintsBelowText:FlxText;
	private var ratsAmountText:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
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
		
		clipboard = new FlxSprite(0, 0, "assets/images/Clipboard.png");
		clipboard.setPosition(FlxG.width / 2 - clipboard.width / 2, FlxG.height / 2 - clipboard.height / 2);
		clipboard.scale.set(1.2, 1.1);
		add(clipboard);
		
		complaintsAboveText = new FlxText(clipboard.x + 50, clipboard.y + 93, FlxG.width, "Maintain the catwalks in the streets.", 9);
		complaintsBelowText = new FlxText(clipboard.x + 50, clipboard.y + 155, FlxG.width, "Maintain the fusebox for the underground.", 9);
		ratsAmountText = new FlxText(clipboard.x + 50, clipboard.y + 215, FlxG.width, "Exterminate rats at all cost.", 9);
		complaintsAboveText.color = complaintsBelowText.color = ratsAmountText.color = FlxColor.BLACK;
		add(complaintsAboveText);
		add(complaintsBelowText);
		add(ratsAmountText);
		
		//FlxG.camera.flash(0);
		super.create();
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
	
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		clipboard = null;
		complaintsAboveText = null;
		complaintsBelowText = null;
		ratsAmountText = null;
		
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.keys.anyJustPressed(["SPACE"]))
		{
			FlxG.sound.play("Select2");
			FlxG.camera.flash(FlxColor.WHITE, 0.5, goToPlay);
		}
		
		super.update();
	}
	
	private function goToPlay()
	{
		FlxG.switchState(new PlayState());
	}
}