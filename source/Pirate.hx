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
	var speed:Int = 30;
	var maxspeed:Int = 300;
	var jumpboom:Int = 1250;
	var wallClimbing:Bool = false;
	var WALL_CLIMB_MAX:Int = 12;
	var wallClimbTimer:Int;
	var jumps:Int = 0;
	
	var groundDrag:Int = 500;
	var airDrag:Int = 500;
	
	public function new(X:Float = 0, Y:Float = 0) {
		super(X, Y);
		loadGraphic(AssetPaths.cowboy__png, true, 150, 150);
		animation.add("idle", [8]);
		animation.add("run", [15, 14, 13, 12, 11, 10, 9], 10);
		animation.add("slide", [3]);
		animation.add("jump", [4]);
		animation.add("fall", [5, 6, 7], 7);
		animation.add("climb", [2, 1, 0, 1, 2, 1, 2], 10, false);
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
		super.update(elapsed);
	}
	
	function control(){
		if (Ctrl.right){
			velocity.x += speed;
			if(isTouching(FlxObject.FLOOR)){
				animation.play("run");
				if (velocity.x < 0){
					animation.play("slide");
					velocity.x += speed;
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
					velocity.x -= speed;
				}
			}
			facing = FlxObject.LEFT;
		}
		if (!Ctrl.left && !Ctrl.right && isTouching(FlxObject.FLOOR) && !isTouching(FlxObject.WALL)){
			animation.play("idle");
		}
		if (!isTouching(FlxObject.FLOOR) && !isTouching(FlxObject.WALL)){
			if (velocity.y < 0 ){
				animation.play("jump");
			}else{
				animation.play("fall");
			}
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
			velocity.y = -jumpboom*1.2;
			if (isTouching(FlxObject.RIGHT)){
				velocity.x = -maxspeed*4;
			}else{
				velocity.x = maxspeed * 4;
			}
		}
	}
	
	public function bounce(){
		velocity.y = -jumpboom;
	}
	
	function wallClimb(){
		var correctSide:Bool = (isTouching(FlxObject.RIGHT) && Ctrl.right) || (isTouching(FlxObject.LEFT) && Ctrl.left);
		if (!wallClimbing && isTouching(FlxObject.WALL) && correctSide){
			wallClimbTimer = WALL_CLIMB_MAX;
			wallClimbing = true;
			if(isTouching(FlxObject.FLOOR)){
				velocity.y = -jumpboom / 5;
			}
			state = "wallclimb";
			animation.play("climb");
		}
		if (wallClimbing && wallClimbTimer > 0 && correctSide){
			wallClimbTimer--;
			velocity.y -= jumpboom/15;
		}
		if (wallClimbing && isTouching(FlxObject.FLOOR) || !correctSide ||isTouching(FlxObject.WALL)&&state=="sidejump"){
			wallClimbing = false;
			state = "idle";
		}
	}
	
}