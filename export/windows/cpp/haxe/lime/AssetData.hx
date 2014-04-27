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
			path.set ("assets/images/FuseBox.png", "assets/images/FuseBox.png");
			type.set ("assets/images/FuseBox.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Ladder.png", "assets/images/Ladder.png");
			type.set ("assets/images/Ladder.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Lights.png", "assets/images/Lights.png");
			type.set ("assets/images/Lights.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
			path.set ("assets/images/UndergroundTile.png", "assets/images/UndergroundTile.png");
			type.set ("assets/images/UndergroundTile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
