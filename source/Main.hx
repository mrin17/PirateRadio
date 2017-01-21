package;

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
		addChild(new FlxGame(1920, 1080, PlayState, 1, 60, 60, true));
	}
}
