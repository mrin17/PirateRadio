package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;



class Main extends Sprite
{
	public static var flash:Bool=false;
	
	public function new()
	{
		#if flash
			flash = true;
		#end
		super();
		addChild(new FlxGame(1920, 1080, StartState, 1, 60, 60, true));
		FlxG.mouse.visible = false;
		Ctrl.update();
	}
}
