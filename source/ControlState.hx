package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * ...
 * @author ...
 */
class ControlState extends FlxState 
{
	var image:FlxSprite;
	public function new() 
	{
		image = new FlxSprite();
		add(image);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (Ctrl.jjump || Ctrl.jactivate){
			FlxG.switchState(new StoryState());
		}
		super.update(elapsed);
	}
	
}