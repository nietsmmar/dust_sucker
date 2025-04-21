import 'package:dust_sucker/player.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(GameWidget(game: SuckGame()));
}

class SuckWorld extends World {
  static const int gridWidth = 10;
  static const int gridHeight = 10;
  static const double tileSize = 32.0; // Each tile is 32x32 pixels
  @override
  Future<void> onLoad() async {
    add(
      RectangleComponent(
        children: [Player('player.png', position: Vector2(0, 0))],
        position: Vector2(
          -(gridWidth * tileSize) / 2,
          -(gridHeight * tileSize) / 2,
        ),
        size: Vector2(gridWidth * tileSize, gridHeight * tileSize),
        paint: Paint()..color = const Color(0xff00ffff), // transparent
      ),
    );
    add(
      RectangleComponent(
        children: [
          Player('player2.png', position: Vector2(2, 2)),
        ],
        position: Vector2(
          -(gridWidth * tileSize) / 2,
          -(gridHeight * tileSize) * 1.7,
        ),
        size: Vector2(gridWidth * tileSize, gridHeight * tileSize),
        paint: Paint()..color = const Color(0xffee0077), // transparent
      ),
    );
  }
}

class SuckGame extends FlameGame
    with SingleGameInstance, HasKeyboardHandlerComponents {
  @override
  Color backgroundColor() => const Color(0x00000000);

  SuckGame() : super(world: SuckWorld());

  @override
  void onLoad() {
    /*final camera = CameraComponent.withFixedResolution(
      width: SuckWorld.gridWidth * SuckWorld.tileSize,
      height: SuckWorld.gridHeight * SuckWorld.tileSize,
    );
    camera.setBounds(
      Rectangle.fromLTWH(
        0,
        0,
        SuckWorld.gridWidth * SuckWorld.tileSize,
        SuckWorld.gridHeight * SuckWorld.tileSize,
      ),
    );*/
  }

  /*@override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      return KeyEventResult.handled;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // ...
  }

  @override
  void update(double dt) {
    super.update(dt);

    // ...
  }*/
}
