package ;
import flixel.system.FlxPreloader;
import flash.Lib;
import flash.display.*;
import flash.text.*;
//import openfl.Assets;

@:bitmap("assets/images/CustomPreload/gamepopper-logo.png") class PreloadImage extends BitmapData {}

class CustomPreloader extends FlxPreloader
{	
	var logo:Bitmap;
	
	public function new() 
	{
		super();
		//Changes minimum display time for preloader to appear.
		minDisplayTime = 5;
	}
	
	private override function create():Void
	{
		super.create();
		
		//Redefine new buffer to clear data from predefined buffer
		_buffer = new Sprite();
		_buffer.scaleX = _buffer.scaleY = 2;
		addChild(_buffer);
		_width = Std.int(Lib.current.stage.stageWidth / _buffer.scaleX);
		_height = Std.int(Lib.current.stage.stageHeight / _buffer.scaleY);
		//Set Background Colour
		_buffer.addChild(new Bitmap(new BitmapData(_width, _height, false, 0xffffff)));
		
		//Initialise and position logo
		//logo = new Bitmap(Assets.getBitmapData(AssetPaths.gamepopper_logo__png, true));
		logo = new Bitmap(new PreloadImage(0,0));
		logo.scaleX = logo.scaleY = 1;
		logo.x = _width / 2 - (logo.width * logo.scaleX) / 2;
		logo.y = _height / 3 - (logo.height * logo.scaleY) / 2;
		logo.alpha = 0;
		_buffer.addChild(logo);
		
		//Initialises new loading bar using predefined bitmap.
		_bmpBar = new Bitmap(new BitmapData(1, 10, false, 0x000000));
		_bmpBar.x = 20;
		_bmpBar.y = _height - 30;
		//_buffer.addChild(_bmpBar);
		
		Font.registerFont(PreloaderFont);
		_text = new TextField();
		_text.defaultTextFormat = new TextFormat("Nokia Cellphone FC Small", 24, 0x000000, false, false, false, "", "", TextFormatAlign.CENTER);
		_text.embedFonts = true;
		_text.selectable = false;
		_text.multiline = false;
		_text.x = 0;
		_text.y = _bmpBar.y - 50;
		_text.width = _width;
		_buffer.addChild(_text);
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