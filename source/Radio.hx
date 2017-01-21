package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Radio extends FlxColorShiftingSprite 
{
	var on:Bool = false;
	var id:Int = 0;
	var sound:FlxSound;
	
	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y+150, FlxColor.fromRGB(100, 100, 100, 255));
		loadGraphic(AssetPaths.radioTower__png);
		id = ID;
		setUpSound();
	}
	
	public function setUpSound() {
		sound = SoundPlayer.setUpRadioSound(x, y + 150);
		sound.play(false, 0, 0);
	}
	
	function getOn(){
		return on;
	}
	
	public function turnOn(){
		on = true;
		SoundPlayer.getHeavier(.25);
		sound.stop();
		checkAllThings();
		FlxG.camera.flash();
	}
	
	function checkAllThings(){
		for (t in PlayState.things) {
			if (t.id == id) {
				t.activate();
			}
		}
	}
	
}