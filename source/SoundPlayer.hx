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
	static var mute:Bool = false;
	static var MAX_VOLUME:Float = 0.7;
	
	public static function start() 
	{
		FlxG.sound.pause();
		if (musics != null){
			for (m in musics){
				m.kill();
			}
		}
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
		musics.members[0].volume = MAX_VOLUME;
	}
	
	public static function getHeavier(rate:Float) {
		var i:Int = 0;
		while (i < musics.length - 1) {
			if (musics.members[i].volume > 0) {
				musics.members[i].volume -= rate;
				musics.members[i + 1].volume += rate;
				if (musics.members[i+1].volume > MAX_VOLUME){
					musics.members[i + 1].volume = MAX_VOLUME;
				}
				break;
			}
			i++;
		}
	}
	
	public static function reset() {
		var i:Int = 1;
		musics.members[0].volume = MAX_VOLUME;
		while (i < musics.length - 1) {
			musics.members[i].volume = 0;
			i++;
		}
	}
	
	public static function muteMe(){
		mute = !mute;
		for (m in musics){
			if(mute){
				m.stop();
			}else{
				m.play();
			}
		}
	}
	
	public static function playMusic(name:String){
		FlxG.sound.pause();
		if (mute) {
			return;
		}
		if(Main.flash){
			FlxG.sound.playMusic("assets/music/" + name + ".mp3", 1, true);
		}else{
			FlxG.sound.playMusic("assets/music/" + name + ".ogg", 1, true);
		}
	}
	
	public static function silence() {
		for (m in musics){
			m.pause();
			m.destroy();
		}
	}
}