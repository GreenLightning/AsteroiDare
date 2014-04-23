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
	}

}