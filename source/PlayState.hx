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
	var lvlname:String = "level1";
	
	public static var player:Pirate;
	var walls:FlxTilemap;
	var image:FlxTilemap;
	
	public static var things:FlxTypedGroup<Thing>;
	var radios:FlxTypedGroup<Radio>;
	
	var bg:FlxSprite;
	var numTowersActivated:Int = 0;
	
	override public function create():Void
	{
		radios = new FlxTypedGroup<Radio>();
		things = new FlxTypedGroup<Thing>();
		
		bg = new FlxSprite(0, 80);
		bg.loadGraphic(AssetPaths.bg__png);
		bg.scrollFactor.set(0.01, 0);// 0.01);
		
		makeLevel();
		
		add(bg);
		add(walls);
		add(image);
		add(radios);
		add(things);
		add(player);
		
		
		walls.visible = false;
		image.visible = true;
		
		FlxG.worldBounds.set(walls.width, walls.height);
		
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER);
		SoundPlayer.start();
		SoundPlayer.reset();
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
		image = load.loadTilemap(AssetPaths.tiles__png, 152, 152, "image");
		load.loadEntities(placeEntities, "entities");
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void //places entities everywhere
	{
		var x:Int = Math.round(Std.parseInt(entityData.get("x"))*9.5);
		var y:Int = Math.round(Std.parseInt(entityData.get("y"))*9.5);
		switch(entityName){
			case "player":	
				player = new Pirate(x, y);
			case "radioTower":	
				radios.add(new Radio(x, y, Std.parseInt(entityData.get("index"))));
			case "NPC":	
				things.add(new NPC(x, y, Std.parseInt(entityData.get("index"))));
			case "drone":
				things.add(new Drone(x, y, Std.parseInt(entityData.get("index"))));
			case "vine":
				things.add(new Vine(x, y, Std.parseInt(entityData.get("index"))));
			case "billboard":
				things.add(new Billboard(x, y, Std.parseInt(entityData.get("index"))));
			case "umbrella":
				things.add(new Umbrella(x, y, Std.parseInt(entityData.get("index"))));
			case "fountain":
				things.add(new Fountain(x, y, Std.parseInt(entityData.get("index"))));
			case "movingPlatform":
				things.add(new MovingPlatform(x, y, Std.parseInt(entityData.get("index")), Std.parseInt(entityData.get("timeMove"))));
			case "laser":
				things.add(new Laser(x, y, Std.parseInt(entityData.get("index")), entityData.get("dir"), entityData.get("cap")=="True"));
		}
	}
	
	private function playerTouchRadio(P:Pirate, R:Radio):Void
	{
		if (Ctrl.jactivate) {
			if (R.turnOn()) {
				numTowersActivated++;
			}
		}
		if (numTowersActivated == 7) {
			// END GAME STUFF GOES HERE!!!!
		}
	}
	
}
