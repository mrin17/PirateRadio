package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Radio extends FlxSprite 
{
	var on:Bool = false;
	var id:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y);
		id = ID;
	}
	
	function getOn(){
		return on;
	}
	
	function turnOn(){
		on = true;
	}
	
	function checkAllThings(){
		
	}
	
}