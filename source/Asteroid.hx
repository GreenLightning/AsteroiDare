import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;

class Asteroid extends FlxSprite {

	private var parent:FlxGroup;
	
	public function new(parent:FlxGroup) {
		super();
		this.parent = parent;
		loadGraphic("graphics/asteroid.png");
		velocity.x = FlxG.random.float(-100, 100);
		velocity.y = FlxG.random.float(-100, 100);
		if (Math.abs(velocity.x) > Math.abs(velocity.y)) {
			x = velocity.x > 0 ? -width : FlxG.width;
			y = velocity.y > 0 ? FlxG.random.float(0, FlxG.height / 2) : FlxG.random.float(FlxG.height / 2, FlxG.height);
		} else {
			y = velocity.y > 0 ? -height : FlxG.height;
			x = velocity.x > 0 ? FlxG.random.float(0, FlxG.width / 2) : FlxG.random.float(FlxG.width / 2, FlxG.width);
		}
		angularVelocity = FlxG.random.float(-15, 15);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (x + width < 0 || y + height < 0 || x > FlxG.width || y > FlxG.height) {
			parent.remove(this, true);
		}
	}

}