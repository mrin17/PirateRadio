package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.tile.FlxTilemapExt;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import SoundPlayer;

class PlayState extends FlxState
{
	var lvlname:String = "testland";
	
	var player:Pirate;
	var walls:FlxTilemap;
	var image:FlxTilemap;
	
	public static var things:FlxTypedGroup<Thing>;
	var radios:FlxTypedGroup<Radio>;
	var soundPlayer:SoundPlayer;
	
	override public function create():Void
	{
		radios = new FlxTypedGroup<Radio>();
		things = new FlxTypedGroup<Thing>();
		makeLevel();
		
		add(image);
		add(player);
		add(walls);
		add(radios);
		add(things);
		
		FlxG.worldBounds.set(walls.width, walls.height);
		
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER);
		SoundPlayer.start();
		super.create();

	}

	override public function update(elapsed:Float):Void
	{
		Ctrl.update();
		FlxG.collide(walls, player);
		FlxG.overlap(player, radios, playerTouchRadio);
		if (FlxG.keys.anyJustPressed(["R"])){
			FlxG.resetState();
		}
		if (FlxG.keys.anyJustPressed(["O"])){
			SoundPlayer.reset();
		}
		if (FlxG.keys.anyJustPressed(["P"])){
			SoundPlayer.getHeavier(.25);
		}
		super.update(elapsed);
	}
	
	function makeLevel(){ //makes a level
		var load:FlxOgmoLoader = new FlxOgmoLoader("assets/data/" + lvlname + ".oel");
		walls = load.loadTilemap(AssetPaths.walls__png, 76, 76, "walls");
		image = load.loadTilemap(AssetPaths.walls__png, 76, 76, "walls");
		load.loadEntities(placeEntities, "entities");
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void //places entities everywhere
	{
		var x:Int = Std.parseInt(entityData.get("x"))*9;
		var y:Int = Std.parseInt(entityData.get("y"))*9;
		switch(entityName){
			case "player":
				player = new Pirate(x, y);
			case "NPC":
				var index:Int = Std.parseInt(entityData.get("index"));
				PlayState.things.add(new NPC(x, y, index));
			case "radioTower":
				var index:Int = Std.parseInt(entityData.get("index"));
				radios.add(new Radio(x, y, index));
		}
	}
	
	private function playerTouchRadio(P:Pirate, R:Radio):Void
	{
		if (Ctrl.up) {
			R.turnOn();
		}
	}
	
}
