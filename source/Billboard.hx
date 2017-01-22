package;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Billboard extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int)
	{
		super(X, Y, ID);
		loadGraphic(AssetPaths.billboard__png, true, 608, 304);
		animation.add("bad", [0]);
		animation.add("good", [1]);
		color = FlxColor.fromRGB(255, 255, 255, 255);
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (PlayState.player.y < y && FlxG.collide(PlayState.player, this)){
		}
		super.update(elapsed);
	}
	
	override public function activate() 
	{
		animation.play("good");
		super.activate();
	}
	
}