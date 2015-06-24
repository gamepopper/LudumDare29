package ;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class RatObject extends FlxSprite
{
	public var touchedObject: Bool = false;
	
	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		loadGraphic("assets/images/RatSheet.png", true, 40, 20);
		animation.add("Walking", [0, 1], 4);
		animation.add("Dead", [2], 0, false);
		
		animation.play("Walking");
		
		velocity.x = 50 + (Math.random() * 50);
		
		if (Math.random() < 0.5)
		{
			x = FlxG.width - 40;
			flipX = true;
			velocity.x = -(50 + (Math.random() * 50));
		}
	}
	
	override public function kill():Void 
	{
		velocity.x = 0;
		alive = false;
		animation.play("Dead");
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (!alive)
		{
			alpha -= 0.01;
		}
		
		super.update(elapsed);
	}
}