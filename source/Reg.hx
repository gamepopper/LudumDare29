package;

import flixel.FlxSprite;
import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	static public var complaintsAbove:Float = 0; //Amount of complaints raised above on streets
	static public var complaintsBelow:Float = 0; //Amount of complaints raised below on underground
	static public var remainingRats:Int = 0; //Amount of complaints raised below on underground
	static public var total:Float = 0; //Amount of Hazards passed.
	
	static public var score:Int = 0; //Last Score - based on amount of complaints, lower the better.
}