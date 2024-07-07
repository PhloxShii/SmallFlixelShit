package;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.FlxObject;

class PlayState extends FlxState
{
    public static var boyfriend:FlxSprite;
    private var camFollow:FlxObject;
    private static var prevCamFollow:FlxObject;
    private var camGame:FlxCamera;

    override public function create()
    {
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('stageback'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		add(stageFront);

        boyfriend = new FlxSprite(770, 450);
        boyfriend.frames = Paths.getSparrowAtlas('BOYFRIEND');
        boyfriend.animation.addByPrefix('idle', 'BF idle dance', 24, false);
        boyfriend.visible = true;
        boyfriend.animation.play('idle', true, false);
        add(boyfriend);

		var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.image('stagecurtains'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
		stageCurtains.updateHitbox();
		stageCurtains.antialiasing = true;
		stageCurtains.scrollFactor.set(1.3, 1.3);
		stageCurtains.active = false;

		add(stageCurtains);

        camGame = new FlxCamera();
        FlxG.cameras.reset(camGame);
        FlxCamera.defaultCameras = [camGame];
        FlxG.camera.follow(boyfriend);
        FlxG.camera.followLerp = 0.1;

        super.create();
    }

    override public function update(elapsed:Float)
    {
        if (FlxG.keys.pressed.LEFT)
        {
            boyfriend.x -= 10;
            boyfriend.flipX = false;
        }

        if (FlxG.keys.pressed.RIGHT)
        {
            boyfriend.x += 10;
            boyfriend.flipX = true;
        }

        if (FlxG.keys.pressed.UP)
        {
            boyfriend.y -= 10;
        }

        if (FlxG.keys.pressed.DOWN)
        {
            boyfriend.y += 10;
        }

        super.update(elapsed);
    }
}