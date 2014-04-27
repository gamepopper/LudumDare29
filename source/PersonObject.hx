package ;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class PersonObject extends FlxSprite
{
	public var steppedOn:Bool = false;
	
	public function new(X:Float, Y:Float) 
	{
		super();
		this.x = X;
		this.y = Y;
	}
	
}