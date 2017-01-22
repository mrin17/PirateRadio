package;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class MovingPlatform extends Thing 
{
	var up:Bool = true;
	var xtick:Int = 0;
	var ytick:Int = 0;
	var xspeed:Int = 5;
	var yspeed:Int = 12;
	var xset:Int = 140;
	var yset:Int = 30;
	var hasPlayer:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, ID);
		xtick = xset;
		ytick = yset;
		loadGraphic(AssetPaths.drone__png, true, 155, 88);
		animation.add("on", [1]);
		mass = 10;
		immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (on){
			fly();
		}
		if (PlayState.player.y<y-height&&FlxG.collide(PlayState.player, this)){
			hasPlayer = true;
		} else {
			hasPlayer = false;
		}
		super.update(elapsed);
	}
	
	override public function activate() 
	{
		animation.play("on");
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
			if (hasPlayer) {
				PlayState.player.velocity.x += xspeed;
			}
			velocity.x += xspeed;
		}else{
			if (hasPlayer) {
				PlayState.player.velocity.x -= xspeed;
			}
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