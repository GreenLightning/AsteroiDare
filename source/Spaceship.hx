import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

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
		move();
		limitVelocity(400);
		stayInBounds();
	}

	private function move():Void {
		var left = ["LEFT", "A"];
		var right = ["RIGHT", "D"];
		var power = ["UP", "W", "SPACE"];
		if (FlxG.keys.anyPressed(left)) {
			angle -= 360 / 2 * FlxG.elapsed;
		}
		if (FlxG.keys.anyPressed(right)) {
			angle += 360 / 2 * FlxG.elapsed;
		}
		angle = (angle + 360) % 360;
		if (FlxG.keys.anyPressed(power)) {
			velocity.x += 100 * Math.sin(Math.PI / 180 * angle) * FlxG.elapsed;
			velocity.y -= 100 * Math.cos(Math.PI / 180 * angle) * FlxG.elapsed;
			if (animation.name != "power") {
				animation.play("power");
			}
		} else {
			if (animation.name != "float") {
				animation.play("float");
			}
		}
	}

	private function limitVelocity(max:Float):Void {
		var lengthSquared = velocity.x * velocity.x + velocity.y * velocity.y;
		if (lengthSquared > max * max) {
			velocity.x = velocity.x * max * max / lengthSquared;
			velocity.y = velocity.y * max * max / lengthSquared;
		}
	}

	private function stayInBounds():Void {
		if (x + width / 2 < 0) {
			x += FlxG.width;
		}
		if (y + height / 2 < 0) {
			y += FlxG.height;
		}
		if (x + width / 2 > FlxG.width) {
			x -= FlxG.width;
		}
		if (y + height / 2 > FlxG.height) {
			y -= FlxG.height;
		}
	}

}