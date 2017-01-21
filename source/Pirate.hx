package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class Pirate extends FlxSprite 
{
	var state:String = "";
	var speed:Int = 40;
	var maxspeed:Int = 300;
	var jumpboom:Int = 1000;
	var wallClimbing:Bool = false;
	var wallClimbTimer:Int = 20;
	var jumps:Int = 0;
	
	
	public function new(X:Float = 0, Y:Float = 0) {
		super(X, Y);
		//loadGraphic(AssetPaths.cowboy__png);
		makeGraphic(152, 152);
		acceleration.y = 2500;
		drag.x = drag.y = 500;
		velocity.y = 200;
	}
	
	override public function update(elapsed:Float):Void 
	{
		wallClimb();
		control();
		jumpRefresh();
		trace(velocity.x);
		super.update(elapsed);
	}
	
	function control(){
		if (Ctrl.right){
			velocity.x += speed;
		}
		if (Ctrl.left){
			velocity.x -= speed;
		}
		if (jumps > 0 && Ctrl.jjump){
			doTheJump();
		}
	}
	
	function jumpRefresh(){
		jumps = 0;
		if (isTouching(FlxObject.FLOOR)||isTouching(FlxObject.WALL)){
			jumps = 1;
		}
	}
	
	function doTheJump(){
		jumps--;
		velocity.y = -jumpboom;
		if (isTouching(FlxObject.WALL) && !isTouching(FlxObject.FLOOR)){
			state = "sidejump";
			velocity.y = -jumpboom;
			if (isTouching(FlxObject.RIGHT)){
				velocity.x = -maxspeed*5;
			}else{
				velocity.x = maxspeed*5;
			}
		}
	}
	
	function wallClimb(){
		if (!wallClimbing && isTouching(FlxObject.WALL)){
			wallClimbTimer = 20;
			wallClimbing = true;
			if(isTouching(FlxObject.FLOOR)){
				velocity.y = -jumpboom / 5;
			}
			state = "wallclimb";
			trace("wallclimb start");
		}
		if (wallClimbing && wallClimbTimer > 0){
			wallClimbTimer--;
			velocity.y -= jumpboom/15;
			trace("climbing");
		}
		if (wallClimbing && isTouching(FlxObject.FLOOR) || isTouching(FlxObject.WALL)&&state=="sidejump"){
			wallClimbing = false;
			state = "idle";
			trace("climb reset");
		}
	}
	
}