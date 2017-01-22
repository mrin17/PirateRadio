package;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Fountain extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, ID);
		loadGraphic(AssetPaths.fountain__png, true, 456, 456);
		animation.add("off", [0]);
		animation.add("on", [1, 2, 3, 2, 1], 15);
		setSize(width - 300, height);
		offset.x += 150;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (on && PlayState.player.y < y + 200 && FlxG.overlap(PlayState.player, this)){
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