package ;
import flixel.FlxSprite;

class ReparingSprite extends FlxSprite
{
	public var MaxHealth:Float = 1;
	
	public function new() 
	{
		super();
	}
	
	public override function update()
	{
		if (health > MaxHealth)
			health = MaxHealth;
		
		super.update();
	}
}