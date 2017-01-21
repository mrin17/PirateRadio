package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Radio extends FlxColorShiftingSprite 
{
	var on:Bool = false;
	var id:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, FlxColor.fromRGB(100, 100, 100, 255));
		loadGraphic(AssetPaths.radioTower__png);
		id = ID;
	}
	
	function getOn(){
		return on;
	}
	
	public function turnOn(){
		on = true;
		checkAllThings();
	}
	
	function checkAllThings(){
		for (t in PlayState.things) {
			if (t.id == id) {
				t.activate();
			}
		}
	}
	
}