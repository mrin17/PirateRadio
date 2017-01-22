package;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Vine extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X-1, Y, ID);
		loadGraphic(AssetPaths.electricFence__png, true, 150, 150);
		animation.add("on", [0, 1], 20, true);
		animation.add("off", [2]);
		animation.play("on");
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (!on && Utils.getDistance(getMidpoint(), PlayState.player.getMidpoint()) < 500 && FlxG.collide(PlayState.player, this)){
			if (PlayState.player.x > x){
				PlayState.player.x = x + width + 20;
			}else{
				PlayState.player.x = x - width - 20;
			}
		}
		super.update(elapsed);
	}
	
	override public function activate() {
		super.activate();
		animation.play("off");
	}
	
}