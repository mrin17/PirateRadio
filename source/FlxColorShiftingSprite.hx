package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class FlxColorShiftingSprite extends FlxSprite 
{
	private var lightening:Bool = false; 
	private var lightenRate:Int = 10;
	
	public function new(?X:Float=0, ?Y:Float=0, ?startColor:FlxColor) 
	{
		super(X, Y);
		color = startColor;
	}
	
	override public function update(elapsed:Float):Void 
	{
		applyColorEffect();
		super.update(elapsed);
	}
	
	private function applyColorEffect():Void 
	{
		if (lightening) {
			color = FlxColor.add(color, FlxColor.fromRGB(lightenRate, lightenRate, lightenRate, color.alpha));
			if (color.red == 255 && color.green == 255 && color.blue == 255) {
				lightening = false;
			}
		}
	}
	
	public function lighten(rate:Int=50):Void {
		color = FlxColor.add(color, FlxColor.fromRGB(rate, rate, rate, color.alpha));
	}
	
	public function fullyLighten(rate:Int=10):Void {
		lightening = true;
		if (rate <= 0) {
			rate = 1;
		}
		lightenRate = rate;
	}
	
}