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
	var MAX_VOLUME:Float = .5;
	var MAX_DIST_AWAY:Float = 100;

	public function new (X:Float = 0, Y:Float = 0)
	{
		super();
		x = X;
		y = Y;
		loadEmbedded("assets/sounds/radioStatic1.wav", true, false);
	}
	
	override function update(elasped:Float) {
		calculateProximityVolume();
		super.update(elasped);
	}
	
	function calculateProximityVolume() {
		var dist:Float = getDistance(new FlxPoint(x, y), FlxG.camera.target.getMidpoint());
		if (dist > 100) {
			volume = 0;
		} else {
			volume = (MAX_DIST_AWAY - dist) / MAX_DIST_AWAY;
		}
	}
	
	public static function getDistance(P1:FlxPoint, P2:FlxPoint):Float {
		var XX:Float = P2.x - P1.x;
		var YY:Float = P2.y - P1.y;
		return Math.sqrt( XX * XX + YY * YY );
	}
	
}