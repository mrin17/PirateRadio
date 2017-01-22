package;

/**
 * ...
 * @author ...
 */
class Umbrella extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, ID);
		loadGraphic(AssetPaths.umbrella__png, true, 304, 380);
		animation.add("off", [1]);
		animation.add("on", [0]);
		animation.play("off");
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (PlayState.player.y < y - height && FlxG.collide(PlayState.player, this)){
			PlayState.player.bounce();
		}
		super.update(elapsed);
	}
	
}