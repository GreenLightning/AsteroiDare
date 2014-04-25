import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;

class Bullet extends FlxSprite {

	private var parent:FlxGroup;
	
	public function new(parent:FlxGroup) {
		super();
		this.parent = parent;
		loadGraphic("graphics/bullet.png");
	}

	override public function update():Void {
		super.update();
		if (x + width < 0 || y + height < 0 || x > FlxG.width || y > FlxG.height) {
			parent.remove(this, true);
		}
	}

}