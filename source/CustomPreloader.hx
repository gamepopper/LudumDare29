package ;
import flixel.system.FlxBasePreloader;
import flash.Lib;
import flash.display.*;
import flash.text.*;
import openfl.display.Bitmap;
import openfl.text.TextField;

@:bitmap("assets/images/CustomPreload/gamepopper-logo.png") class PreloadImage extends BitmapData {}


class CustomPreloader extends FlxBasePreloader
{	
	var logo:Bitmap;
	var _bmpBar:Bitmap;
	var _text:TextField;
	
	public function new() 
	{
		super();
		//Changes minimum display time for preloader to appear.
		minDisplayTime = 5;
	}
	
	private override function create():Void
	{
		super.create();
		
		scaleX = scaleY = 2;
		_width = Std.int(Lib.current.stage.stageWidth / scaleX);
		_height = Std.int(Lib.current.stage.stageHeight / scaleY);
		//Set Background Colour
		addChild(new Bitmap(new BitmapData(_width, _height, false, 0xffffff)));
		
		//Initialise and position logo
		//logo = new Bitmap(Assets.getBitmapData(AssetPaths.gamepopper_logo__png, true));
		logo = new Bitmap(new PreloadImage(0,0));
		logo.scaleX = logo.scaleY = 1;
		logo.x = _width / 2 - (logo.width * logo.scaleX) / 2;
		logo.y = _height / 3 - (logo.height * logo.scaleY) / 2;
		logo.alpha = 0;
		addChild(logo);
		
		//Initialises new loading bar using predefined bitmap.
		_bmpBar = new Bitmap(new BitmapData(1, 10, false, 0x000000));
		_bmpBar.x = 20;
		_bmpBar.y = _height - 30;
		//addChild(_bmpBar);
		
		_text = new TextField();
		_text.defaultTextFormat = new TextFormat("Nokia Cellphone FC Small", 24, 0x000000, false, false, false, "", "", TextFormatAlign.CENTER);
		_text.embedFonts = true;
		_text.selectable = false;
		_text.multiline = false;
		_text.x = 0;
		_text.y = _bmpBar.y - 50;
		_text.width = _width;
		addChild(_text);
	}
	
	public override function update(Percent:Float):Void
	{
		_bmpBar.width = Percent * (_width - 40);
		
		var dots:String = "";
		
		for (i in 0...cast(Percent * 15,Int))
		{
			dots += ".";
		}
		
		_text.text = dots + "LOADING" + dots;
		
		if (Percent < 0.75)
		{
			logo.alpha = Percent * 1.25;
		}
		else
		{
			logo.alpha = 1;
		}
	}
}