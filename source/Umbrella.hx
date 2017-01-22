package;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Umbrella extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y-213, ID);
		loadGraphic(AssetPaths.umbrella__png, true, 304, 380);
		animation.add("off", [1]);
		animation.add("on", [0]);
		animation.play("off");
		immovable = true;
		setSize(width, height - 50);
	}
	
	override public function update(elapsed:Float):Void 
	{
		trace(PlayState.player.y);
		trace(y);
		if (on&&PlayState.player.y < y && PlayState.player.velocity.y > 0 && FlxG.overlap(PlayState.player, this)){
			PlayState.player.bounce();
		}
		super.update(elapsed);
	}
	
	override public function activate() 
	{
		animation.play("on");
		super.activate();
	}
	
}