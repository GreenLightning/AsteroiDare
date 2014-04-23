import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;

class Asteroids extends FlxGroup {

	public function new() {
		super();
		FlxTimer.start(1, spawn);
	}

	private function spawn(timer:FlxTimer):Void {
		var asteroid = new Asteroid(this);
		add(asteroid);
		FlxTimer.start(FlxRandom.floatRanged(0.5, 1.5), spawn);
	}

}