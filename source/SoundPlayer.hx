package;

import flixel.FlxObject;
import flixel.system.FlxSound;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.system.FlxAssets;

/**
 * ...
 * @author ...
 */

class SoundPlayer
{
	public static var musics:FlxTypedGroup<FlxSound>;
	
	public static function start() 
	{
		musics = new FlxTypedGroup<FlxSound>();
		// We're using the actual path because Flash can only play MP3s and non-flash can only play OGGs
		var extension:String = ".ogg";
		if (Main.flash) {
			extension = ".mp3";
		}
		musics.add(new FlxSound().loadEmbedded("assets/music/FactoryBirthLight60ms" + extension, true, false));
		musics.add(new FlxSound().loadEmbedded("assets/music/FactoryBirthMedium60ms" + extension, true, false));
		musics.add(new FlxSound().loadEmbedded("assets/music/FactoryBirthHeavy60ms" + extension, true, false));
		for (m in musics) {
			//m.play(ForceRestart:Bool = false, StartTime:Float = 0.0, ?EndTime:Float) (for end time of song)
			m.volume = 0;
			m.play(false, 0.0);
		}
		musics.members[0].volume = 1;
	}
	
	public static function setUpRadioSound(x:Float, y:Float):FlxSound {
		var snd:FlxSound = new FlxSound();
		snd.loadEmbedded("assets/sounds/radioStatic1.wav", true, false);
		snd.proximity(x,y,FlxG.camera.target, FlxG.width *.2);
		return snd;
	}
	
	public static function getHeavier(rate:Float) {
		var i:Int = 0;
		while (i < musics.length - 1) {
			if (musics.members[i].volume > 0) {
				musics.members[i].volume -= rate;
				musics.members[i + 1].volume += rate;
				break;
			}
			i++;
		}
	}
	
	public static function reset() {
		var i:Int = 1;
		musics.members[0].volume = 1;
		while (i < musics.length - 1) {
			musics.members[i].volume = 0;
			i++;
		}
	}
}