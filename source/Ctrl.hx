package;
import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.FlxGamepadInputID;

/**
 * ...
 * @author ...
 */
class Ctrl
{
	
	//jump/shoot
	public static var jump:Bool = false;
	public static var shoot:Bool = false;
	//just pressed
	public static var jjump:Bool = false;
	public static var jshoot:Bool = false;
	//just released
	public static var rjump:Bool = false;
	public static var rshoot:Bool = false;
	//directions
	public static var left:Bool = false;
	public static var right:Bool = false;
	public static var up:Bool = false;
	public static var down:Bool = false;
	//misc
	public static var pause:Bool = false;
	public static var map:Bool = false;
	
	public function new() 
	{
	}
	
	public static function update(){
		jump = FlxG.keys.anyPressed(["Z"]);
		shoot = FlxG.keys.anyPressed(["X"]);
		jjump = FlxG.keys.anyJustPressed(["Z"]);
		jshoot = FlxG.keys.anyJustPressed(["X"]);
		rjump = FlxG.keys.anyJustReleased(["Z"]);
		rshoot = FlxG.keys.anyJustReleased(["X"]);
		up = FlxG.keys.anyPressed(["UP"]);
		down = FlxG.keys.anyPressed(["DOWN"]);
		left = FlxG.keys.anyPressed(["LEFT"]);
		right = FlxG.keys.anyPressed(["RIGHT"]);
		pause = FlxG.keys.anyJustPressed(["P"]);
		map = FlxG.keys.anyJustPressed(["SPACE"]);
		altcontrol();
	}
	
	public static function altcontrol() {
		var gp:FlxGamepad = FlxG.gamepads.lastActive;
		if (gp == null) {
			return;
		}
		gp.deadZone = .5;
		right = right || gp.analog.value.LEFT_STICK_X>0 || gp.anyJustPressed([FlxGamepadInputID.DPAD_RIGHT]);
		up = up || gp.analog.value.LEFT_STICK_Y<0 || gp.anyJustPressed([FlxGamepadInputID.DPAD_UP]);
		left = left || gp.analog.value.LEFT_STICK_X < 0 || gp.anyJustPressed([FlxGamepadInputID.DPAD_LEFT]);
		down = down || gp.analog.value.LEFT_STICK_Y > 0 || gp.anyJustPressed([FlxGamepadInputID.DPAD_DOWN]);
		pause = pause || gp.anyJustPressed([FlxGamepadInputID.START]);
		map = map || gp.anyJustPressed([FlxGamepadInputID.BACK]);
		
		jump = jump || gp.anyPressed([FlxGamepadInputID.A]);
		jjump = jjump || gp.anyJustPressed([FlxGamepadInputID.A]);
		rjump = rjump || gp.anyJustReleased([FlxGamepadInputID.A]);
		
		shoot = shoot || gp.anyPressed([FlxGamepadInputID.X]);
		jshoot = jshoot || gp.anyJustPressed([FlxGamepadInputID.X]);
		rshoot = rshoot || gp.anyJustReleased([FlxGamepadInputID.X]);
	}
}