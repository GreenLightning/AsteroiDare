import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class PlayState extends FlxState {
	
	override public function create():Void {
		super.create();
		var ship = new Spaceship();
		ship.x = FlxG.width / 2;
		ship.y = FlxG.height / 2;
		add(ship);
	}
	
	override public function destroy():Void {
		super.destroy();
	}
	
	override public function update():Void {
		super.update();
	}
	
}