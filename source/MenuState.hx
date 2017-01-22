package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * ...
 * @author ...
 */
class MenuState extends FlxState 
{
	var image:FlxSprite;
	
	override public function create():Void 
	{
		image = new FlxSprite();
		image.loadGraphic(AssetPaths.menu__png);
		add(image);
		super.create();
	} 
	
	override public function update(elapsed:Float):Void 
	{
		Ctrl.update();
		if (Ctrl.jjump || Ctrl.jactivate){
			FlxG.switchState(new StoryState());
		}
		super.update(elapsed);
	}
	
}