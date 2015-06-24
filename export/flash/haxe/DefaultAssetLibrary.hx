package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/Level.txt", __ASSET__assets_data_level_txt);
		type.set ("assets/data/Level.txt", AssetType.TEXT);
		className.set ("assets/images/BridgeTiles.png", __ASSET__assets_images_bridgetiles_png);
		type.set ("assets/images/BridgeTiles.png", AssetType.IMAGE);
		className.set ("assets/images/CatWalk.png", __ASSET__assets_images_catwalk_png);
		type.set ("assets/images/CatWalk.png", AssetType.IMAGE);
		className.set ("assets/images/Clipboard.png", __ASSET__assets_images_clipboard_png);
		type.set ("assets/images/Clipboard.png", AssetType.IMAGE);
		className.set ("assets/images/CustomPreload/gamepopper-logo.png", __ASSET__assets_images_custompreload_gamepopper_logo_png);
		type.set ("assets/images/CustomPreload/gamepopper-logo.png", AssetType.IMAGE);
		className.set ("assets/images/FuseBox.png", __ASSET__assets_images_fusebox_png);
		type.set ("assets/images/FuseBox.png", AssetType.IMAGE);
		className.set ("assets/images/HammerHand.png", __ASSET__assets_images_hammerhand_png);
		type.set ("assets/images/HammerHand.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/Ladder.png", __ASSET__assets_images_ladder_png);
		type.set ("assets/images/Ladder.png", AssetType.IMAGE);
		className.set ("assets/images/Lights.png", __ASSET__assets_images_lights_png);
		type.set ("assets/images/Lights.png", AssetType.IMAGE);
		className.set ("assets/images/Logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/Logo.png", AssetType.IMAGE);
		className.set ("assets/images/Person1.png", __ASSET__assets_images_person1_png);
		type.set ("assets/images/Person1.png", AssetType.IMAGE);
		className.set ("assets/images/Person2.png", __ASSET__assets_images_person2_png);
		type.set ("assets/images/Person2.png", AssetType.IMAGE);
		className.set ("assets/images/Person3.png", __ASSET__assets_images_person3_png);
		type.set ("assets/images/Person3.png", AssetType.IMAGE);
		className.set ("assets/images/Person4.png", __ASSET__assets_images_person4_png);
		type.set ("assets/images/Person4.png", AssetType.IMAGE);
		className.set ("assets/images/Person5.png", __ASSET__assets_images_person5_png);
		type.set ("assets/images/Person5.png", AssetType.IMAGE);
		className.set ("assets/images/PlayerSheet.png", __ASSET__assets_images_playersheet_png);
		type.set ("assets/images/PlayerSheet.png", AssetType.IMAGE);
		className.set ("assets/images/RatSheet.png", __ASSET__assets_images_ratsheet_png);
		type.set ("assets/images/RatSheet.png", AssetType.IMAGE);
		className.set ("assets/images/Train.png", __ASSET__assets_images_train_png);
		type.set ("assets/images/Train.png", AssetType.IMAGE);
		className.set ("assets/images/UndergroundTile.png", __ASSET__assets_images_undergroundtile_png);
		type.set ("assets/images/UndergroundTile.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/Hammer.mp3", __ASSET__assets_sounds_hammer_mp3);
		type.set ("assets/sounds/Hammer.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Hammer.wav", __ASSET__assets_sounds_hammer_wav);
		type.set ("assets/sounds/Hammer.wav", AssetType.SOUND);
		className.set ("assets/sounds/Ladder.mp3", __ASSET__assets_sounds_ladder_mp3);
		type.set ("assets/sounds/Ladder.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Ladder.wav", __ASSET__assets_sounds_ladder_wav);
		type.set ("assets/sounds/Ladder.wav", AssetType.SOUND);
		className.set ("assets/sounds/Select.mp3", __ASSET__assets_sounds_select_mp3);
		type.set ("assets/sounds/Select.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Select.wav", __ASSET__assets_sounds_select_wav);
		type.set ("assets/sounds/Select.wav", AssetType.SOUND);
		className.set ("assets/sounds/Select1.mp3", __ASSET__assets_sounds_select1_mp3);
		type.set ("assets/sounds/Select1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Select1.wav", __ASSET__assets_sounds_select1_wav);
		type.set ("assets/sounds/Select1.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/Streets.mp3", __ASSET__assets_sounds_streets_mp3);
		type.set ("assets/sounds/Streets.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Streets.wav", __ASSET__assets_sounds_streets_wav);
		type.set ("assets/sounds/Streets.wav", AssetType.SOUND);
		className.set ("assets/sounds/Train.mp3", __ASSET__assets_sounds_train_mp3);
		type.set ("assets/sounds/Train.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Train.wav", __ASSET__assets_sounds_train_wav);
		type.set ("assets/sounds/Train.wav", AssetType.SOUND);
		className.set ("assets/sounds/Walk.mp3", __ASSET__assets_sounds_walk_mp3);
		type.set ("assets/sounds/Walk.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Walk.wav", __ASSET__assets_sounds_walk_wav);
		type.set ("assets/sounds/Walk.wav", AssetType.SOUND);
		className.set ("Streets", __ASSET__assets_sounds_streets_mp4);
		type.set ("Streets", AssetType.SOUND);
		className.set ("Train", __ASSET__assets_sounds_train_mp4);
		type.set ("Train", AssetType.SOUND);
		className.set ("Hammer", __ASSET__assets_sounds_hammer_mp4);
		type.set ("Hammer", AssetType.SOUND);
		className.set ("Ladder", __ASSET__assets_sounds_ladder_mp4);
		type.set ("Ladder", AssetType.SOUND);
		className.set ("Select1", __ASSET__assets_sounds_select_mp4);
		type.set ("Select1", AssetType.SOUND);
		className.set ("Select2", __ASSET__assets_sounds_select2);
		type.set ("Select2", AssetType.SOUND);
		className.set ("Walk", __ASSET__assets_sounds_walk_mp4);
		type.set ("Walk", AssetType.SOUND);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Level.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/BridgeTiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CatWalk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Clipboard.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CustomPreload/gamepopper-logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/FuseBox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HammerHand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Ladder.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lights.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Person1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Person2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Person3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Person4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Person5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/PlayerSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/RatSheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Train.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/UndergroundTile.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Hammer.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Hammer.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Ladder.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Ladder.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Select.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Select.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Select1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Select1.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Streets.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Streets.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Train.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Train.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Walk.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Walk.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "Streets";
		path.set (id, "assets/sounds/Streets.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "Train";
		path.set (id, "assets/sounds/Train.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "Hammer";
		path.set (id, "assets/sounds/Hammer.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "Ladder";
		path.set (id, "assets/sounds/Ladder.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "Select1";
		path.set (id, "assets/sounds/Select.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "Select2";
		path.set (id, "assets/sounds/Select1.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "Walk";
		path.set (id, "assets/sounds/Walk.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/Level.txt", __ASSET__assets_data_level_txt);
		type.set ("assets/data/Level.txt", AssetType.TEXT);
		
		className.set ("assets/images/BridgeTiles.png", __ASSET__assets_images_bridgetiles_png);
		type.set ("assets/images/BridgeTiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/CatWalk.png", __ASSET__assets_images_catwalk_png);
		type.set ("assets/images/CatWalk.png", AssetType.IMAGE);
		
		className.set ("assets/images/Clipboard.png", __ASSET__assets_images_clipboard_png);
		type.set ("assets/images/Clipboard.png", AssetType.IMAGE);
		
		className.set ("assets/images/CustomPreload/gamepopper-logo.png", __ASSET__assets_images_custompreload_gamepopper_logo_png);
		type.set ("assets/images/CustomPreload/gamepopper-logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/FuseBox.png", __ASSET__assets_images_fusebox_png);
		type.set ("assets/images/FuseBox.png", AssetType.IMAGE);
		
		className.set ("assets/images/HammerHand.png", __ASSET__assets_images_hammerhand_png);
		type.set ("assets/images/HammerHand.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/Ladder.png", __ASSET__assets_images_ladder_png);
		type.set ("assets/images/Ladder.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lights.png", __ASSET__assets_images_lights_png);
		type.set ("assets/images/Lights.png", AssetType.IMAGE);
		
		className.set ("assets/images/Logo.png", __ASSET__assets_images_logo_png);
		type.set ("assets/images/Logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/Person1.png", __ASSET__assets_images_person1_png);
		type.set ("assets/images/Person1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Person2.png", __ASSET__assets_images_person2_png);
		type.set ("assets/images/Person2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Person3.png", __ASSET__assets_images_person3_png);
		type.set ("assets/images/Person3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Person4.png", __ASSET__assets_images_person4_png);
		type.set ("assets/images/Person4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Person5.png", __ASSET__assets_images_person5_png);
		type.set ("assets/images/Person5.png", AssetType.IMAGE);
		
		className.set ("assets/images/PlayerSheet.png", __ASSET__assets_images_playersheet_png);
		type.set ("assets/images/PlayerSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/RatSheet.png", __ASSET__assets_images_ratsheet_png);
		type.set ("assets/images/RatSheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/Train.png", __ASSET__assets_images_train_png);
		type.set ("assets/images/Train.png", AssetType.IMAGE);
		
		className.set ("assets/images/UndergroundTile.png", __ASSET__assets_images_undergroundtile_png);
		type.set ("assets/images/UndergroundTile.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/Hammer.mp3", __ASSET__assets_sounds_hammer_mp3);
		type.set ("assets/sounds/Hammer.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Hammer.wav", __ASSET__assets_sounds_hammer_wav);
		type.set ("assets/sounds/Hammer.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Ladder.mp3", __ASSET__assets_sounds_ladder_mp3);
		type.set ("assets/sounds/Ladder.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Ladder.wav", __ASSET__assets_sounds_ladder_wav);
		type.set ("assets/sounds/Ladder.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Select.mp3", __ASSET__assets_sounds_select_mp3);
		type.set ("assets/sounds/Select.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Select.wav", __ASSET__assets_sounds_select_wav);
		type.set ("assets/sounds/Select.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Select1.mp3", __ASSET__assets_sounds_select1_mp3);
		type.set ("assets/sounds/Select1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Select1.wav", __ASSET__assets_sounds_select1_wav);
		type.set ("assets/sounds/Select1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/Streets.mp3", __ASSET__assets_sounds_streets_mp3);
		type.set ("assets/sounds/Streets.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Streets.wav", __ASSET__assets_sounds_streets_wav);
		type.set ("assets/sounds/Streets.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Train.mp3", __ASSET__assets_sounds_train_mp3);
		type.set ("assets/sounds/Train.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Train.wav", __ASSET__assets_sounds_train_wav);
		type.set ("assets/sounds/Train.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Walk.mp3", __ASSET__assets_sounds_walk_mp3);
		type.set ("assets/sounds/Walk.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Walk.wav", __ASSET__assets_sounds_walk_wav);
		type.set ("assets/sounds/Walk.wav", AssetType.SOUND);
		
		className.set ("Streets", __ASSET__assets_sounds_streets_mp4);
		type.set ("Streets", AssetType.SOUND);
		
		className.set ("Train", __ASSET__assets_sounds_train_mp4);
		type.set ("Train", AssetType.SOUND);
		
		className.set ("Hammer", __ASSET__assets_sounds_hammer_mp4);
		type.set ("Hammer", AssetType.SOUND);
		
		className.set ("Ladder", __ASSET__assets_sounds_ladder_mp4);
		type.set ("Ladder", AssetType.SOUND);
		
		className.set ("Select1", __ASSET__assets_sounds_select_mp4);
		type.set ("Select1", AssetType.SOUND);
		
		className.set ("Select2", __ASSET__assets_sounds_select2);
		type.set ("Select2", AssetType.SOUND);
		
		className.set ("Walk", __ASSET__assets_sounds_walk_mp4);
		type.set ("Walk", AssetType.SOUND);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
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
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
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
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
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
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_bridgetiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_catwalk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_clipboard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_custompreload_gamepopper_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fusebox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hammerhand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_ladder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lights_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_person1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_person2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_person3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_person4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_person5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_playersheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ratsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_train_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_undergroundtile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hammer_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hammer_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_ladder_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_ladder_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_streets_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_streets_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_train_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_train_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_walk_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_walk_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_streets_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_train_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hammer_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_ladder_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_select2 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_walk_mp4 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

















































#else



#if (windows || mac || linux)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/data/Level.txt") #if display private #end class __ASSET__assets_data_level_txt extends lime.utils.ByteArray {}
@:image("assets/images/BridgeTiles.png") #if display private #end class __ASSET__assets_images_bridgetiles_png extends lime.graphics.Image {}
@:image("assets/images/CatWalk.png") #if display private #end class __ASSET__assets_images_catwalk_png extends lime.graphics.Image {}
@:image("assets/images/Clipboard.png") #if display private #end class __ASSET__assets_images_clipboard_png extends lime.graphics.Image {}
@:image("assets/images/CustomPreload/gamepopper-logo.png") #if display private #end class __ASSET__assets_images_custompreload_gamepopper_logo_png extends lime.graphics.Image {}
@:image("assets/images/FuseBox.png") #if display private #end class __ASSET__assets_images_fusebox_png extends lime.graphics.Image {}
@:image("assets/images/HammerHand.png") #if display private #end class __ASSET__assets_images_hammerhand_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/Ladder.png") #if display private #end class __ASSET__assets_images_ladder_png extends lime.graphics.Image {}
@:image("assets/images/Lights.png") #if display private #end class __ASSET__assets_images_lights_png extends lime.graphics.Image {}
@:image("assets/images/Logo.png") #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:image("assets/images/Person1.png") #if display private #end class __ASSET__assets_images_person1_png extends lime.graphics.Image {}
@:image("assets/images/Person2.png") #if display private #end class __ASSET__assets_images_person2_png extends lime.graphics.Image {}
@:image("assets/images/Person3.png") #if display private #end class __ASSET__assets_images_person3_png extends lime.graphics.Image {}
@:image("assets/images/Person4.png") #if display private #end class __ASSET__assets_images_person4_png extends lime.graphics.Image {}
@:image("assets/images/Person5.png") #if display private #end class __ASSET__assets_images_person5_png extends lime.graphics.Image {}
@:image("assets/images/PlayerSheet.png") #if display private #end class __ASSET__assets_images_playersheet_png extends lime.graphics.Image {}
@:image("assets/images/RatSheet.png") #if display private #end class __ASSET__assets_images_ratsheet_png extends lime.graphics.Image {}
@:image("assets/images/Train.png") #if display private #end class __ASSET__assets_images_train_png extends lime.graphics.Image {}
@:image("assets/images/UndergroundTile.png") #if display private #end class __ASSET__assets_images_undergroundtile_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/Hammer.mp3") #if display private #end class __ASSET__assets_sounds_hammer_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Hammer.wav") #if display private #end class __ASSET__assets_sounds_hammer_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Ladder.mp3") #if display private #end class __ASSET__assets_sounds_ladder_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Ladder.wav") #if display private #end class __ASSET__assets_sounds_ladder_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Select.mp3") #if display private #end class __ASSET__assets_sounds_select_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Select.wav") #if display private #end class __ASSET__assets_sounds_select_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Select1.mp3") #if display private #end class __ASSET__assets_sounds_select1_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Select1.wav") #if display private #end class __ASSET__assets_sounds_select1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/Streets.mp3") #if display private #end class __ASSET__assets_sounds_streets_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Streets.wav") #if display private #end class __ASSET__assets_sounds_streets_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Train.mp3") #if display private #end class __ASSET__assets_sounds_train_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Train.wav") #if display private #end class __ASSET__assets_sounds_train_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Walk.mp3") #if display private #end class __ASSET__assets_sounds_walk_mp3 extends lime.utils.ByteArray {}
@:file("assets/sounds/Walk.wav") #if display private #end class __ASSET__assets_sounds_walk_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/Streets.mp3") #if display private #end class __ASSET__assets_sounds_streets_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/Train.mp3") #if display private #end class __ASSET__assets_sounds_train_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/Hammer.mp3") #if display private #end class __ASSET__assets_sounds_hammer_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/Ladder.mp3") #if display private #end class __ASSET__assets_sounds_ladder_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/Select.mp3") #if display private #end class __ASSET__assets_sounds_select_mp4 extends lime.utils.ByteArray {}
@:file("assets/sounds/Select1.mp3") #if display private #end class __ASSET__assets_sounds_select2 extends lime.utils.ByteArray {}
@:file("assets/sounds/Walk.mp3") #if display private #end class __ASSET__assets_sounds_walk_mp4 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}



#end

#if openfl

#end

#end
#end

