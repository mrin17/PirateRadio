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
	
	//jump/activate
	public static var jump:Bool = false;
	public static var activate:Bool = false;
	//just pressed
	public static var jjump:Bool = false;
	public static var jactivate:Bool = false;
	//just released
	public static var rjump:Bool = false;
	public static var ractivate:Bool = false;
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
		activate = FlxG.keys.anyPressed(["X"]);
		jjump = FlxG.keys.anyJustPressed(["Z"]);
		jactivate = FlxG.keys.anyJustPressed(["X"]);
		rjump = FlxG.keys.anyJustReleased(["Z"]);
		ractivate = FlxG.keys.anyJustReleased(["X"]);
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
		
		activate = activate || gp.anyPressed([FlxGamepadInputID.X]);
		jactivate = jactivate || gp.anyJustPressed([FlxGamepadInputID.X]);
		ractivate = ractivate || gp.anyJustReleased([FlxGamepadInputID.X]);
	}
}