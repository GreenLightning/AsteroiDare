import flixel.FlxG;
import flixel.FlxSprite;

class Starfield extends FlxSprite {
	
	public function new() {
		super();
		loadGraphic("graphics/starfield.png");
		x = (FlxG.width - width) / 2;
		y = (FlxG.height - height) / 2;
		angularVelocity = 1.5;
	}

}