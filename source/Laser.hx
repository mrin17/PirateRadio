package;

/**
 * ...
 * @author ...
 */
class Laser extends Thing 
{

	public function new(?X:Float=0, ?Y:Float=0, ID:Int, right:Bool, left:Bool, up:Bool, down:Bool, cap:Bool) 
	{
		super(X, Y, ID);
		if (right||left){
			angle = 90;
			flipX = true;
		}
	}
	
}