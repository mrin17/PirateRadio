package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class NPC extends Thing 
{
	static var c:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y+2, ID);
		c++;
		loadGraphic("assets/images/crowdnpc" + c + ".png", true, 150, 150);
		if (c > 2){
			c = 0;
		}
		animation.add("off", [1]);
		animation.add("on", [0]);
		animation.play("off");
	}
	
	override function activate() 
	{
		animation.play("on");
		super.activate();
	}
}