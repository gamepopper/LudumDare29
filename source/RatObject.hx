package ;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class RatObject extends FlxSprite
{
	public var touchedObject: Bool = false;
	
	public function new(X:Float, Y:Float) 
	{
		super(X,Y);
	}
	
	override public function kill():Void 
	{
		velocity.x = 0;
		alive = false;
	}
	
	override public function update():Void 
	{
		if (!alive)
		{
			alpha -= 0.01;
		}
		
		super.update();
	}
}