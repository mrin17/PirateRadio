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
	
	var groundDrag:Int = 500;
	var airDrag:Int = 500;
	
	public function new(X:Float = 0, Y:Float = 0) {
		super(X, Y);
		loadGraphic(AssetPaths.cowboy__png, true, 150, 150);
		animation.add("idle", [4]);
		animation.add("run", [5, 6, 7, 8, 9, 10, 11], 10);
		animation.add("slide", [0]);
		animation.add("jump", [1, 2, 3], 5);
		animation.play("idle");
		acceleration.y = 2500;
		drag.x = drag.y = 1000;
		velocity.y = 200;
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
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
			if(isTouching(FlxObject.FLOOR)){
				animation.play("run");
				if (velocity.x < 0){
					animation.play("slide");
				}
			}
			facing = FlxObject.RIGHT;
		}
		if (Ctrl.left){
			velocity.x -= speed;
			if(isTouching(FlxObject.FLOOR)){
				animation.play("run");
				if (velocity.x > 0){
					animation.play("slide");
				}
			}
			facing = FlxObject.LEFT;
		}
		if (!Ctrl.left && !Ctrl.right && isTouching(FlxObject.FLOOR)){
			animation.play("idle");
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
		animation.play("jump");
		velocity.y = -jumpboom;
		if (isTouching(FlxObject.WALL) && !isTouching(FlxObject.FLOOR)){
			state = "sidejump";
			velocity.y = -jumpboom/1.2;
			if (isTouching(FlxObject.RIGHT)){
				velocity.x = -maxspeed*7;
			}else{
				velocity.x = maxspeed*7;
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