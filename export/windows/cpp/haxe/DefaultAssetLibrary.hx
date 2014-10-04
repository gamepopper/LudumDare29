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
		
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/Level.txt", "assets/data/Level.txt");
		type.set ("assets/data/Level.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/images/BridgeTiles.png", "assets/images/BridgeTiles.png");
		type.set ("assets/images/BridgeTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/CatWalk.png", "assets/images/CatWalk.png");
		type.set ("assets/images/CatWalk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Clipboard.png", "assets/images/Clipboard.png");
		type.set ("assets/images/Clipboard.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/CustomPreload/gamepopper-logo.png", "assets/images/CustomPreload/gamepopper-logo.png");
		type.set ("assets/images/CustomPreload/gamepopper-logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/FuseBox.png", "assets/images/FuseBox.png");
		type.set ("assets/images/FuseBox.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/HammerHand.png", "assets/images/HammerHand.png");
		type.set ("assets/images/HammerHand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/images/Ladder.png", "assets/images/Ladder.png");
		type.set ("assets/images/Ladder.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Lights.png", "assets/images/Lights.png");
		type.set ("assets/images/Lights.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Logo.png", "assets/images/Logo.png");
		type.set ("assets/images/Logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Person1.png", "assets/images/Person1.png");
		type.set ("assets/images/Person1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Person2.png", "assets/images/Person2.png");
		type.set ("assets/images/Person2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Person3.png", "assets/images/Person3.png");
		type.set ("assets/images/Person3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Person4.png", "assets/images/Person4.png");
		type.set ("assets/images/Person4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Person5.png", "assets/images/Person5.png");
		type.set ("assets/images/Person5.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/PlayerSheet.png", "assets/images/PlayerSheet.png");
		type.set ("assets/images/PlayerSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/RatSheet.png", "assets/images/RatSheet.png");
		type.set ("assets/images/RatSheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/Train.png", "assets/images/Train.png");
		type.set ("assets/images/Train.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/UndergroundTile.png", "assets/images/UndergroundTile.png");
		type.set ("assets/images/UndergroundTile.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/sounds/Hammer.mp3", "assets/sounds/Hammer.mp3");
		type.set ("assets/sounds/Hammer.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Hammer.wav", "assets/sounds/Hammer.wav");
		type.set ("assets/sounds/Hammer.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/Ladder.mp3", "assets/sounds/Ladder.mp3");
		type.set ("assets/sounds/Ladder.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Ladder.wav", "assets/sounds/Ladder.wav");
		type.set ("assets/sounds/Ladder.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/Select.mp3", "assets/sounds/Select.mp3");
		type.set ("assets/sounds/Select.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Select.wav", "assets/sounds/Select.wav");
		type.set ("assets/sounds/Select.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/Select1.mp3", "assets/sounds/Select1.mp3");
		type.set ("assets/sounds/Select1.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Select1.wav", "assets/sounds/Select1.wav");
		type.set ("assets/sounds/Select1.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/sounds/Streets.mp3", "assets/sounds/Streets.mp3");
		type.set ("assets/sounds/Streets.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Streets.wav", "assets/sounds/Streets.wav");
		type.set ("assets/sounds/Streets.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/Train.mp3", "assets/sounds/Train.mp3");
		type.set ("assets/sounds/Train.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Train.wav", "assets/sounds/Train.wav");
		type.set ("assets/sounds/Train.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/Walk.mp3", "assets/sounds/Walk.mp3");
		type.set ("assets/sounds/Walk.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sounds/Walk.wav", "assets/sounds/Walk.wav");
		type.set ("assets/sounds/Walk.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Streets", "assets/sounds/Streets.wav");
		type.set ("Streets", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Train", "assets/sounds/Train.wav");
		type.set ("Train", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Hammer", "assets/sounds/Hammer.wav");
		type.set ("Hammer", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Ladder", "assets/sounds/Ladder.wav");
		type.set ("Ladder", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Select1", "assets/sounds/Select.wav");
		type.set ("Select1", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Select2", "assets/sounds/Select1.wav");
		type.set ("Select2", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("Walk", "assets/sounds/Walk.wav");
		type.set ("Walk", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#elseif html5
		
		
		
		#else
		
		#if (windows || mac || linux)
		
		var loadManifest = false;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		loadManifest = true;
		
		
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

















































#elseif html5

















































#elseif (windows || mac || linux)




#end
