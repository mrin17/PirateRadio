package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class StoryState extends FlxState 
{
	var dlg:Array<String> = ["- 30XX A.D. -\n\nMETROPOLIS: A CITY OF ROBOTS -- AND A CITY IN RUINS.\n\nTWO HUNDRED YEARS AGO, THE PEOPLE -- MY PEOPLE -- FELL TO THE ORDER.", "THE ORDER BLED THIS CITY DRY, TURNING IT INTO A GHOST TOWN.\n\nBACK THEN, THERE WAS NOTHING I COULD DO BUT WATCH.", "BUT NOW... NOW I KNOW HOW TO REVITALIZE THIS CITY. BRING IT BACK TO LIFE.\n\nAND IT STARTS WITH THESE RADIO TOWERS."];
	var count:Int = 0;
	var image:FlxSprite;
	var txt:FlxText;
	
	override public function create():Void
	{
		FlxG.camera.flash();
		image = new FlxSprite(440, 100);
		image.loadGraphic(AssetPaths.story__png, true, 1050, 601);
		image.animation.add("story", [0, 1, 2]);
		image.animation.play("story");
		image.animation.pause();
		txt = new FlxText(0, FlxG.height - FlxG.height / 3.5, 1920, "Something something radios", 32);
		txt.alignment = "center";
		txt.text = dlg[count];
		add(image);
		add(txt);
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
			FlxG.sound.pause();
			FlxG.switchState(new PlayState());
			return;
		}
		txt.text = dlg[count];
		image.animation.frameIndex = count;
	}
	
}