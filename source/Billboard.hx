package;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Billboard extends Thing 
{
	static var c:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ID:Int)
	{
		super(X, Y, ID);
		c++;
		loadGraphic("assets/images/billboard" + c+".png", true, 608, 304);
		if (c > 2){
			c = 0;
		}
		animation.add("bad", [0]);
		animation.add("good", [1]);
		color = FlxColor.fromRGB(255, 255, 255, 255);
		immovable = true;
		allowCollisions = 0;
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