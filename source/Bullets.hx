import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;

class Bullets extends FlxGroup {

	private var parent:PlayState;

	public function new(parent:PlayState) {
		super();
		this.parent = parent;
	}

	override public function update():Void {
		super.update();
		FlxG.overlap(this, parent.asteroids, onOverlap, testOverlap);
	}

	private function testOverlap(sprite1, sprite2):Bool {
		return FlxG.pixelPerfectOverlap(sprite1, sprite2, 128);
	}

	private function onOverlap(bullet:Bullet, asteroid:Asteroid):Void {
		bullet.kill();
		this.remove(bullet, true);
		asteroid.kill();
		parent.asteroids.remove(asteroid, true);
	}

}