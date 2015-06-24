package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class ScoreState extends FlxState
{
	private var clipboard:FlxSprite;
	
	private var complaintsAboveText:FlxText;
	private var complaintsBelowText:FlxText;
	private var ratsAmountText:FlxText;
	private var finalScoreText:FlxText;
	
	private var finalScore:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		clipboard = new FlxSprite(0, 0, "assets/images/Clipboard.png");
		clipboard.setPosition(FlxG.width / 2 - clipboard.width / 2, FlxG.height / 2 - clipboard.height / 2);
		clipboard.scale.set(1.2, 1.1);
		add(clipboard);
		
		complaintsAboveText = new FlxText(clipboard.x + 50, clipboard.y + 93, FlxG.width, "Street Complaints: ", 10);
		complaintsBelowText = new FlxText(clipboard.x + 50, clipboard.y + 155, FlxG.width, "Underground Complaints: ", 10);
		ratsAmountText = new FlxText(clipboard.x + 50, clipboard.y + 215, FlxG.width, "Rat Infestation Levels: ", 10);
		finalScoreText = new FlxText(clipboard.x + 50, clipboard.y + 245, FlxG.width, "Overall Score: ", 11);
		complaintsAboveText.color = complaintsBelowText.color = ratsAmountText.color = finalScoreText.color = FlxColor.BLACK;
		add(complaintsAboveText);
		add(complaintsBelowText);
		add(ratsAmountText);
		add(finalScoreText);
		
		complaintsAboveText.text = "Street Complaints: " + Math.ceil(Reg.complaintsAbove);
		complaintsBelowText.text = "Underground Complaints: " + Math.ceil(Reg.complaintsBelow);
		ratsAmountText.text = "Rat Infestation Complaints: " + Reg.remainingRats;
		finalScore = Math.ceil(((Reg.total / 3) - (Reg.complaintsAbove + Reg.complaintsBelow + Reg.remainingRats) / 3));
		finalScoreText.text = "Overall Score: " + finalScore;
		
		FlxG.save.bind("Highscore");
		
		FlxG.save.data.HighScore = finalScore;
		
		if (finalScore < Reg.score)
			FlxG.save.data.HighScore = Reg.score;
		else
			Reg.score = finalScore;
		
		FlxG.save.flush();
		//FlxG.camera.flash(0);
		super.create();
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
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.anyJustPressed(["SPACE"]))
		{
			FlxG.sound.play("Select2");
			FlxG.camera.fade(FlxColor.BLACK, 1, false, goToMenu);
		}
		super.update(elapsed);
	}
	
	private function goToMenu()
	{
		FlxG.switchState(new MenuState());
	}
}