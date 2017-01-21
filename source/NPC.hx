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
		loadGraphic(AssetPaths.npc__png);
		
	}
	
	override function activate() 
	{
		super.activate();
	}
}