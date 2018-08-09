import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState {

	public var asteroids:Asteroids;
	public var bullets:Bullets;
	public var player:Spaceship;
	
	override public function create():Void {
		super.create();

		add(new Starfield());

		asteroids = new Asteroids(this);
		add(asteroids);

		bullets = new Bullets(this);
		add(bullets);

		player = new Spaceship(this);
		add(player);
	}
	
	override public function destroy():Void {
		super.destroy();
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
	
}