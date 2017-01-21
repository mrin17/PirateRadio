package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class NPC extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, ID);
		loadGraphic(AssetPaths.npc__png, true, 90, 152);
		animation.add("off", [0]);
		animation.add("on", [1]);
	}
	
	override function activate() 
	{
		animation.play("on");
		super.activate();
	}
}