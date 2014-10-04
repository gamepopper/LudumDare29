package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
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
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
