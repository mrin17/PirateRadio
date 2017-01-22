package;

/**
 * ...
 * @author ...
 */
class Billboard extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int) 
	{
		super(X, Y, ID);
		animation
		animation.add("bad");
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (PlayState.player.y<y-height && FlxG.collide(PlayState.player, this)){
		}
		super.update(elapsed);
	}
	
	override public function activate() 
	{
		animation.play("good");
		super.activate();
	}
	
}