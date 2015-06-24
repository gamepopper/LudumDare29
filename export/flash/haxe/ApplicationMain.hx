#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new CustomPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/Level.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/BridgeTiles.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/CatWalk.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Clipboard.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/CustomPreload/gamepopper-logo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/FuseBox.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/HammerHand.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/Ladder.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Lights.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Logo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Person1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Person2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Person3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Person4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Person5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/PlayerSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/RatSheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Train.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/UndergroundTile.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/Hammer.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Hammer.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Ladder.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Ladder.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Select.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Select.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Select1.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Select1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/Streets.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Streets.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Train.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Train.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Walk.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Walk.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Streets.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Train.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Hammer.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Ladder.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Select.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Select1.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Walk.mp3");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (1315865),
			borderless: false,
			company: "Gamepopper",
			depthBuffer: false,
			file: "manhole",
			fps: Std.int (60),
			fullscreen: false,
			hardware: true,
			height: Std.int (720),
			orientation: "portrait",
			packageName: "com.example.myapp",
			resizable: true,
			stencilBuffer: true,
			title: "Under Maintenance",
			version: "0.7.0",
			vsync: true,
			width: Std.int (1280),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1280, 720, "141419");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
