import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.math.FlxRandom;

class Spaceship extends FlxSprite {

	private var parent:PlayState;
	private var hitSound:FlxSound;
	private var coolDown:Float = 0;

	public function new(parent:PlayState) {
		super();
		this.parent = parent;
		hitSound = FlxG.sound.load("sounds/hit.wav");
		loadGraphic("graphics/spaceship.png", true, 64, 64);
		animation.add("float", [0]);
		animation.add("power", [1, 2, 1, 3], 25, true);
		animation.play("float");
		x = FlxG.width / 2;
		y = FlxG.height / 2;
		velocity.x = FlxG.random.float(-50, 50);
		velocity.y = FlxG.random.float(-50, 50);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		move();
		limitVelocity(400);
		stayInBounds();
	}

	private function move():Void {
		var left = [LEFT, A];
		var right = [RIGHT, D];
		var power = [DOWN, S];
		var fire = [UP, W, SPACE];
		if (FlxG.keys.anyPressed(left)) {
			angle -= 270 * FlxG.elapsed;
		}
		if (FlxG.keys.anyPressed(right)) {
			angle += 270 * FlxG.elapsed;
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
		coolDown -= FlxG.elapsed;
		if (FlxG.keys.anyPressed(fire)) {
			checkFireBullet();
		}
	}

	private function checkFireBullet():Void {
		if(coolDown <= 0) {
			coolDown = 0.2;
			fireBullet();
		}
	}

	private function fireBullet():Void {
		var bullet = new Bullet(parent.bullets);
		bullet.x = x + (width - bullet.width) / 2 + Math.sin(Math.PI / 180 * angle) * 16;
		bullet.y = y + (height - bullet.height) / 2 - Math.cos(Math.PI / 180 * angle) * 16;
		bullet.velocity.x =  Math.sin(Math.PI / 180 * angle) * 300;
		bullet.velocity.y = -Math.cos(Math.PI / 180 * angle) * 300;
		parent.bullets.add(bullet);
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

	public function hit():Void {
		hitSound.play(true);
	}

}