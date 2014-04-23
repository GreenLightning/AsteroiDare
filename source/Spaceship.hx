import flixel.FlxSprite;
import flixel.FlxG;

class Spaceship extends FlxSprite {

	public function new() {
		super();
		loadGraphic("graphics/spaceship.png", true, false, 64, 64);
		animation.add("float", [0]);
		animation.add("power", [1, 2, 1, 3], 20, true);
		animation.play("float");
	}

	override public function update():Void {
		super.update();
		if (FlxG.keys.justPressed.SPACE) {
			animation.play("power");
		}
		if (FlxG.keys.justReleased.SPACE) {
			animation.play("float");
		}
		if (FlxG.keys.pressed.SPACE) {
			velocity.y -= 100 * FlxG.elapsed;
		}
		limitVelocity(400);
	}

	private function limitVelocity(max:Float):Void {
		var lengthSquared = velocity.x * velocity.x + velocity.y * velocity.y;
		if (lengthSquared > max * max) {
			velocity.x = velocity.x * max * max / lengthSquared;
			velocity.y = velocity.y * max * max / lengthSquared;
		}
	}

}