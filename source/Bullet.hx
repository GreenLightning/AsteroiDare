import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;

class Bullet extends FlxSprite {

	private var parent:FlxGroup;
	
	public function new(parent:FlxGroup) {
		super();
		this.parent = parent;
		loadGraphic("graphics/bullet.png");
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (x + width < 0 || y + height < 0 || x > FlxG.width || y > FlxG.height) {
			parent.remove(this, true);
		}
	}

}