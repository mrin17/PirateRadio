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
	var dlg:Array<String> = ["Something something ending", "something something ending", "its hiiiiiiiiiiiiiiiiiigh noon"];
	var count:Int = 0;
	var image:FlxSprite;
	var txt:FlxText;
	
	override public function create():Void
	{
		image = new FlxSprite(540, 160);
		image.loadGraphic(AssetPaths.story__png, true, 800, 400);
		image.animation.add("story", [0, 1, 2]);
		image.animation.play("story");
		image.animation.pause();
		txt = new FlxText(0, FlxG.height - FlxG.height / 3, 1920, "Something something radios", 18);
		txt.alignment = "center";
		txt.text = dlg[count];
		add(image);
		add(txt);
		count = 0;
		Ctrl.update();
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		Ctrl.update();
		if (Ctrl.jjump || Ctrl.jactivate){
			next();
			FlxG.camera.flash();
		}
		super.update(elapsed);
	}
	
	function next(){
		count++;
		if (count == 3){
			FlxG.switchState(new PlayState());
			return;
		}
		txt.text = dlg[count];
		image.animation.frameIndex = count;
	}
	
}