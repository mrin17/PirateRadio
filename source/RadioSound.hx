package;

import flixel.system.FlxSound;
import flixel.math.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class RadioSound extends FlxSound 
{
	var MAX_VOLUME:Float = .1;
	var MAX_DIST_AWAY:Float = 800;
	var myX:Float;
	var myY:Float;

	public function new (X:Float = 0, Y:Float = 0)
	{
		super();
		myX = X;
		myY = Y;
		loadEmbedded("assets/sounds/radioStatic1.wav", true, false);
		volume = 0;
	}
	
	public function calculateProximityVolume() {
		
		trace(FlxG.camera.target.getMidpoint());
		var dist:Float = getDistance(new FlxPoint(myX, myY), FlxG.camera.target.getMidpoint());
		if (dist > MAX_DIST_AWAY) {
			volume = 0;
		} else {
			volume = (MAX_DIST_AWAY - dist) / MAX_DIST_AWAY * MAX_VOLUME;
		}
	}
	
	public static function getDistance(P1:FlxPoint, P2:FlxPoint):Float {
		var XX:Float = P2.x - P1.x;
		var YY:Float = P2.y - P1.y;
		return Math.sqrt( XX * XX + YY * YY );
	}
	
}