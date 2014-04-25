import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;

class Asteroids extends FlxGroup {

	private var parent:PlayState;

	public function new(parent:PlayState) {
		super();
		this.parent = parent;
		FlxTimer.start(1, spawn);
	}

	private function spawn(timer:FlxTimer):Void {
		var asteroid = new Asteroid(this);
		add(asteroid);
		FlxTimer.start(FlxRandom.floatRanged(1, 5), spawn);
	}

	override public function update():Void {
		super.update();
		FlxG.overlap(parent.player, this, onOverlap, testOverlap);
	}

	private function testOverlap(sprite1, sprite2):Bool {
		return FlxG.pixelPerfectOverlap(sprite1, sprite2);
	}

	private function onOverlap(player:Spaceship, asteroid:Asteroid):Void {
		asteroid.kill();
		remove(asteroid, true);
	}

}