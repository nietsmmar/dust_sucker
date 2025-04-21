import 'package:dust_sucker/player.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';

void main() {
  runApp(GameWidget(game: SuckGame()));
}

class SuckWorld extends World {
  static const int gridWidth = 11;
  static const int gridHeight = 11;
  static const double tileSize = 32.0; // Each tile is 32x32 pixels
  @override
  Future<void> onLoad() async {
    add(
      RectangleComponent(
        anchor: Anchor.topCenter,
        children: [
          Player(
            'player.png',
            position: Vector2(
              (gridWidth / 2).floor() * tileSize,
              gridHeight * tileSize - tileSize,
            ),
          ),
        ],
        position: Vector2.zero(),
        size: Vector2(gridWidth * tileSize, gridHeight * tileSize),
        paint: Paint()..color = const Color(0xff00ffff), // transparent
      ),
    );
    add(
      RectangleComponent(
        anchor: Anchor.bottomCenter,
        children: [Player('player2.png', position: Vector2(
          (gridWidth / 2).floor() * tileSize,
          gridHeight * tileSize - tileSize,))],
        position: Vector2.zero(),
        size: Vector2(gridWidth * tileSize, gridHeight * tileSize),
        paint: Paint()..color = const Color(0xffee0077), // transparent
      ),
    );
  }
}

class SuckGame extends FlameGame
    with SingleGameInstance, HasKeyboardHandlerComponents {
  @override
  Color backgroundColor() => const Color(0x001e1e1e);

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
