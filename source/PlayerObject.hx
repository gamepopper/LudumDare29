package ;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class PlayerObject extends FlxSprite
{

	public function new(X:Float, Y:Float) 
	{
		super();
		this.x = X;
		this.y = Y;
	}
	
	override public function update():Void 
	{		
		velocity.x = 0;
		if (FlxG.keys.anyPressed(["LEFT", "A"]))
		{
			velocity.x = -200;
			facing = FlxObject.LEFT;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"]))
		{
			velocity.x = 200;
			facing = FlxObject.RIGHT;
		}
		
		super.update();
	}
}