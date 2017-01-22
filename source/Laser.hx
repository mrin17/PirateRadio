package;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Laser extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int, dir:String, cap:Bool) 
	{
		super(X + 51, Y, ID);
		loadGraphic(AssetPaths.laser__png, true, 50, 152);
		immovable = true;
		color=FlxColor.fromRGB(255, 255, 255, 255);
		if (cap){
			animation.add("i", [1]);
			animation.play("i");
		}
		switch (dir){
			case "r":
				angle = 90;
			case "l":
				angle = 270;
			case "d":
				flipY = true;
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (!on && Utils.getDistance(getMidpoint(), PlayState.player.getMidpoint()) < 500 && FlxG.collide(PlayState.player, this)){
		}
		super.update(elapsed);
	}
	
	override public function activate() 
	{
		visible = false;
		super.activate();
	}
	
}