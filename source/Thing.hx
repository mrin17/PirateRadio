package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Thing extends FlxColorShiftingSprite 
{
	public var id:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, FlxColor.fromRGB(100, 100, 100, 255));
		id = ID;
		
	}
	
	// Override this if you want different activate() functionality
	public function activate() 
	{
		fullyLighten();
	}
	
	
}