package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.util.FlxSave;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var flashText:FlxText;
	
	private var timer:Float = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		var bgRailStation = new FlxSprite(0, 100);
		bgRailStation.makeGraphic(FlxG.width, 320, 0xff332E26);
		add(bgRailStation);
		
		var logo = new FlxSprite(0, 0, "assets/images/Logo.png");
		logo.setPosition(FlxG.width / 2 - logo.width / 2, 200);
		logo.scale.set(2.2, 2);
		add(logo);
		
		var bgUndergoundTile = new FlxGroup();
		var bgTile = new FlxSprite(0, 0, "assets/images/UndergroundTile.png");
		bgTile.solid = false;
		
		for (xTile in 0 ... 32)
		{
			for (yTile in 0 ... 8)
			{
				var tempTile = new FlxSprite(xTile * 40, 100 + (yTile * 40));
				tempTile.loadGraphicFromSprite(bgTile);
				tempTile.solid = false;
				bgUndergoundTile.add(tempTile);
			}
		}
		add(bgUndergoundTile);
		
		var lightA = new FlxSprite(360 - 400, 100, "assets/images/Lights.png");
		var lightB = new FlxSprite(360 + 400, 100, "assets/images/Lights.png");
		add(lightA);
		add(lightB);
		
		var gpText = new FlxText(30, 700, FlxG.width, "Made By Gamepopper", 12);
		var ldText = new FlxText(1130, 700, 120, "Ludum Dare 29", 12);
		ldText.alignment = "right";
		
		flashText = new FlxText(0, 450, FlxG.width, "PRESS START", 21);
		flashText.alignment = "center";
		add(flashText);
		
		var controlsText = new FlxText(0, 500, FlxG.width, "LEFT/RIGHT (or A/D): MOVE  -  SPACE: ACTION", 16);
		controlsText.alignment = "center";
		add(controlsText);
		
		add(gpText);
		add(ldText);
		FlxG.camera.fade(FlxColor.BLACK, 3, true);
		
		FlxG.save.bind("Highscore");
		
		var highscore:FlxText = new FlxText(0, 700, FlxG.width, "Highscore: ", 12);
		
		if (FlxG.save.data.Highscore == null)
		{
			FlxG.save.data.Highscore = 0;
			Reg.score = 0;
			FlxG.save.flush();
		}
		else
		{
			Reg.score = FlxG.save.data.Highscore;
		}
		

		highscore.text = "Highscore: " + FlxG.save.data.Highscore; 

		
		highscore.alignment = "center";
		
		//add(highscore);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		timer += FlxG.elapsed;
		
		if (timer > 0.5)
		{
			flashText.visible = !flashText.visible;
			timer = 0;
		}
		
		if (FlxG.keys.anyJustPressed(["SPACE"]))
		{
			FlxG.sound.play("Select1");
			FlxG.camera.fade(FlxColor.BLACK, 1, false, goToInstructions);
		}
		super.update();
	}
	
	private function goToInstructions()
	{
		FlxG.switchState(new InstructionsState());
	}
}