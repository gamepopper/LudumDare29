package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(flash.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/Level.txt", __ASSET__assets_data_level_txt);
		type.set ("assets/data/Level.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/BridgeTiles.png", __ASSET__assets_images_bridgetiles_png);
		type.set ("assets/images/BridgeTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/CatWalk.png", __ASSET__assets_images_catwalk_png);
		type.set ("assets/images/CatWalk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/FuseBox.png", __ASSET__assets_images_fusebox_png);
		type.set ("assets/images/FuseBox.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/HammerHand.png", __ASSET__assets_images_hammerhand_png);
		type.set ("assets/images/HammerHand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/Ladder.png", __ASSET__assets_images_ladder_png);
		type.set ("assets/images/Ladder.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Lights.png", __ASSET__assets_images_lights_png);
		type.set ("assets/images/Lights.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Person1.png", __ASSET__assets_images_person1_png);
		type.set ("assets/images/Person1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Person2.png", __ASSET__assets_images_person2_png);
		type.set ("assets/images/Person2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Person3.png", __ASSET__assets_images_person3_png);
		type.set ("assets/images/Person3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Person4.png", __ASSET__assets_images_person4_png);
		type.set ("assets/images/Person4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Person5.png", __ASSET__assets_images_person5_png);
		type.set ("assets/images/Person5.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/PlayerSheet.png", __ASSET__assets_images_playersheet_png);
		type.set ("assets/images/PlayerSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/RatSheet.png", __ASSET__assets_images_ratsheet_png);
		type.set ("assets/images/RatSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/UndergroundTile.png", __ASSET__assets_images_undergroundtile_png);
		type.set ("assets/images/UndergroundTile.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("assets/data/data-goes-here.txt", "text", "assets/data/data-goes-here.txt");
		addExternal("assets/data/Level.txt", "text", "assets/data/Level.txt");
		addExternal("assets/images/BridgeTiles.png", "image", "assets/images/BridgeTiles.png");
		addExternal("assets/images/CatWalk.png", "image", "assets/images/CatWalk.png");
		addExternal("assets/images/FuseBox.png", "image", "assets/images/FuseBox.png");
		addExternal("assets/images/HammerHand.png", "image", "assets/images/HammerHand.png");
		addExternal("assets/images/images-go-here.txt", "text", "assets/images/images-go-here.txt");
		addExternal("assets/images/Ladder.png", "image", "assets/images/Ladder.png");
		addExternal("assets/images/Lights.png", "image", "assets/images/Lights.png");
		addExternal("assets/images/Person1.png", "image", "assets/images/Person1.png");
		addExternal("assets/images/Person2.png", "image", "assets/images/Person2.png");
		addExternal("assets/images/Person3.png", "image", "assets/images/Person3.png");
		addExternal("assets/images/Person4.png", "image", "assets/images/Person4.png");
		addExternal("assets/images/Person5.png", "image", "assets/images/Person5.png");
		addExternal("assets/images/PlayerSheet.png", "image", "assets/images/PlayerSheet.png");
		addExternal("assets/images/RatSheet.png", "image", "assets/images/RatSheet.png");
		addExternal("assets/images/UndergroundTile.png", "image", "assets/images/UndergroundTile.png");
		addExternal("assets/music/music-goes-here.txt", "text", "assets/music/music-goes-here.txt");
		addExternal("assets/sounds/sounds-go-here.txt", "text", "assets/sounds/sounds-go-here.txt");
		addExternal("assets/sounds/beep.mp3", "music", "assets/sounds/beep.mp3");
		addExternal("assets/sounds/flixel.mp3", "music", "assets/sounds/flixel.mp3");
		
		
		#else
		
		#if (windows || mac || linux)
		
		var loadManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/Level.txt", __ASSET__assets_data_level_txt);
		type.set ("assets/data/Level.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/BridgeTiles.png", __ASSET__assets_images_bridgetiles_png);
		type.set ("assets/images/BridgeTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/CatWalk.png", __ASSET__assets_images_catwalk_png);
		type.set ("assets/images/CatWalk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/FuseBox.png", __ASSET__assets_images_fusebox_png);
		type.set ("assets/images/FuseBox.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/HammerHand.png", __ASSET__assets_images_hammerhand_png);
		type.set ("assets/images/HammerHand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/Ladder.png", __ASSET__assets_images_ladder_png);
		type.set ("assets/images/Ladder.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Lights.png", __ASSET__assets_images_lights_png);
		type.set ("assets/images/Lights.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Person1.png", __ASSET__assets_images_person1_png);
		type.set ("assets/images/Person1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Person2.png", __ASSET__assets_images_person2_png);
		type.set ("assets/images/Person2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Person3.png", __ASSET__assets_images_person3_png);
		type.set ("assets/images/Person3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Person4.png", __ASSET__assets_images_person4_png);
		type.set ("assets/images/Person4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Person5.png", __ASSET__assets_images_person5_png);
		type.set ("assets/images/Person5.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/PlayerSheet.png", __ASSET__assets_images_playersheet_png);
		type.set ("assets/images/PlayerSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/RatSheet.png", __ASSET__assets_images_ratsheet_png);
		type.set ("assets/images/RatSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/UndergroundTile.png", __ASSET__assets_images_undergroundtile_png);
		type.set ("assets/images/UndergroundTile.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		
		#else
		
		var loadManifest = true;
		
		#end
		
		if (loadManifest) {
			try {
				
				#if blackberry
				var bytes = ByteArray.readFile ("app/native/manifest");
				#elseif tizen
				var bytes = ByteArray.readFile ("../res/manifest");
				#elseif emscripten
				var bytes = ByteArray.readFile ("assets/manifest");
				#else
				var bytes = ByteArray.readFile ("manifest");
				#end
				
				if (bytes != null) {
					
					bytes.position = 0;
					
					if (bytes.length > 0) {
						
						var data = bytes.readUTFBytes (bytes.length);
						
						if (data != null && data.length > 0) {
							
							var manifest:Array<AssetData> = Unserializer.run (data);
							
							for (asset in manifest) {
								
								if (!className.exists(asset.id)) {
									
									path.set (asset.id, asset.path);
									type.set (asset.id, asset.type);
									
								}
							}
						
						}
					
					}
				
				} else {
				
					trace ("Warning: Could not load asset manifest");
				
				}
			
			} catch (e:Dynamic) {
			
				trace ("Warning: Could not load asset manifest");
			
			}
		
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif openfl_html5
		
		return null;
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_bridgetiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_catwalk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_fusebox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_hammerhand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_ladder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_lights_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_person1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_person2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_person3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_person4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_person5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_playersheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ratsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_undergroundtile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5
























#elseif (windows || mac || linux)


@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray {}
@:file("assets/data/Level.txt") class __ASSET__assets_data_level_txt extends flash.utils.ByteArray {}
@:bitmap("assets/images/BridgeTiles.png") class __ASSET__assets_images_bridgetiles_png extends flash.display.BitmapData {}
@:bitmap("assets/images/CatWalk.png") class __ASSET__assets_images_catwalk_png extends flash.display.BitmapData {}
@:bitmap("assets/images/FuseBox.png") class __ASSET__assets_images_fusebox_png extends flash.display.BitmapData {}
@:bitmap("assets/images/HammerHand.png") class __ASSET__assets_images_hammerhand_png extends flash.display.BitmapData {}
@:file("assets/images/images-go-here.txt") class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray {}
@:bitmap("assets/images/Ladder.png") class __ASSET__assets_images_ladder_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Lights.png") class __ASSET__assets_images_lights_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Person1.png") class __ASSET__assets_images_person1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Person2.png") class __ASSET__assets_images_person2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Person3.png") class __ASSET__assets_images_person3_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Person4.png") class __ASSET__assets_images_person4_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Person5.png") class __ASSET__assets_images_person5_png extends flash.display.BitmapData {}
@:bitmap("assets/images/PlayerSheet.png") class __ASSET__assets_images_playersheet_png extends flash.display.BitmapData {}
@:bitmap("assets/images/RatSheet.png") class __ASSET__assets_images_ratsheet_png extends flash.display.BitmapData {}
@:bitmap("assets/images/UndergroundTile.png") class __ASSET__assets_images_undergroundtile_png extends flash.display.BitmapData {}
@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound {}


#end
