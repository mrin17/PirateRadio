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
	var sound:RadioSound;
	
	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y+159, FlxColor.fromRGB(100, 100, 100, 255));
		loadGraphic(AssetPaths.radioTower__png, true, 151,304);
		animation.add("off", [0]);
		animation.add("on", [1]);
		id = ID;
		sound = new RadioSound(x, y + 150);
		sound.play(false, 0, 0);
	}
	
	override public function update(elapsed:Float):Void 
	{
		sound.calculateProximityVolume();
		super.update(elapsed);
	}
	
	function getOn(){
		return on;
	}
	
	public function turnOn():Bool{
		if (on) {
			return false;
		}
		animation.play("on");
		on = true;
		SoundPlayer.getHeavier(.34);
		sound.stop();
		checkAllThings();
		FlxG.camera.flash();
		return true;
	}
	
	function checkAllThings(){
		for (t in PlayState.things) {
			if (t.id == id) {
				t.activate();
			}
		}
	}
	
	override public function destroy():Void 
	{
		sound.destroy();
		super.destroy();
	}
	
}