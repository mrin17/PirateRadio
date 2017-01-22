package;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Drone extends Thing 
{
	var up:Bool = true;
	var xtick:Int = 0;
	var ytick:Int = 0;
	var xspeed:Int = 5;
	var yspeed:Int = 12;
	var xset:Int = 180;
	var yset:Int = 30;
	
	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, ID);
		xtick = xset;
		ytick = yset;
		loadGraphic(AssetPaths.drone__png);
		mass = 10;
		immovable = true;
		color = FlxColor.fromRGB(100, 100, 100, 255);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (on){
			fly();
		}
		if (PlayState.player.y<y-height&&FlxG.collide(PlayState.player, this)){
			PlayState.player.bounce();
			trace(PlayState.player.y);
			trace(y);
		}
		super.update(elapsed);
	}
	
	override public function activate() 
	{
		color = FlxColor.fromRGB(255, 255, 255, 255);
		super.activate();
	}
	
	function fly(){
		xtick--;
		ytick--;
		if (up){
			velocity.y -= yspeed;
		}else{
			velocity.y += yspeed;
		}
		if (!flipX){
			velocity.x += xspeed;
		}else{
			velocity.x -= xspeed;
		}
		if (xtick < 0){
			flipX = !flipX;
			xtick = xset;
			velocity.x = 0;
		}
		if (ytick < 0){
			up = !up;
			ytick = yset;
			velocity.y = 0;
		}
	}
	
}