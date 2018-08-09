import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;

class Bullets extends FlxGroup {

	private var parent:PlayState;
	private var explosion:FlxSound;

	public function new(parent:PlayState) {
		super();
		this.parent = parent;
		explosion = FlxG.sound.load("sounds/explosion.wav");
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		FlxG.overlap(this, parent.asteroids, onOverlap, testOverlap);
	}

	private function testOverlap(sprite1, sprite2):Bool {
		return FlxG.pixelPerfectOverlap(sprite1, sprite2, 128);
	}

	private function onOverlap(bullet:Bullet, asteroid:Asteroid):Void {
		explosion.play(true);
		bullet.kill();
		this.remove(bullet, true);
		asteroid.kill();
		parent.asteroids.remove(asteroid, true);
	}

}