package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class EndState extends FlxState 
{
	var count:Int = 0;
	var image:FlxSprite;
	var txt:FlxText;
	
	override public function create():Void
	{
		FlxG.camera.flash();
		image = new FlxSprite(440, 100);
		image.loadGraphic(AssetPaths.outro__png);
		txt = new FlxText(0, FlxG.height - FlxG.height / 4, 1920, "The End", 18);
		txt.alignment = "center";
		add(image);
		add(txt);
		super.create();
	}
	
}