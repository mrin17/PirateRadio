package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class StartState extends FlxState 
{
	var state:String = "ggj";
	var tickSet:Int = 240;
	var tick:Int = 0;
	var image:FlxSprite;
	
	override public function create():Void 
	{
		image = new FlxSprite();
		image.loadGraphic(AssetPaths.ggjsplash__jpg);
		add(image);
		Ctrl.update();
		tick = tickSet-120;
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		trace(tick);
		tick--;
		if (tick < 1){
			FlxG.camera.fade(FlxColor.BLACK, .5, false, next);
		}
		super.update(elapsed);
	}
	
	function next(){
		tick = tickSet;
		FlxG.camera.fade(FlxColor.BLACK, .5, true);
		switch(state){
			case "ggj":
				image.loadGraphic(AssetPaths.credits__png);
				state = "credits";
			case "credits":
				image.loadGraphic(AssetPaths.controls__png);
				state = "intro";
			case "intro":
				FlxG.switchState(new MenuState());
		}
	}
	
}