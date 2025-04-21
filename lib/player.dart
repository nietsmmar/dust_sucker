import 'package:dust_sucker/main.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Player extends SpriteComponent
    with HasGameReference<SuckGame>, KeyboardHandler {
  late Vector2 targetPosition;

  final String spritePath;

  Player(this.spritePath, {required super.position})
    : super(size: Vector2.all(SuckWorld.tileSize));

  bool get isMoving => position.distanceTo(targetPosition) > 0;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    targetPosition = position.clone();
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Smooth movement towards the target
    position.moveToTarget(targetPosition, 250 * dt); // 250 px/sec speed
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (isMoving) {
      return false;
    }
    if (event is KeyDownEvent) {
      Vector2 move = Vector2.zero();

      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        move = Vector2(0, -SuckWorld.tileSize);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        move = Vector2(0, SuckWorld.tileSize);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        move = Vector2(-SuckWorld.tileSize, 0);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        move = Vector2(SuckWorld.tileSize, 0);
      }

      final newPos = targetPosition + move;
      if (_withinBounds(newPos)) {
        targetPosition = newPos;
      }
    }

    return true;
  }

  bool _withinBounds(Vector2 pos) {
    double width = (SuckWorld.gridWidth * SuckWorld.tileSize);
    double height = (SuckWorld.gridHeight * SuckWorld.tileSize);
    return pos.x >= 0 &&
        pos.y >= 0 &&
        pos.x < width &&
        pos.y < height;
  }
}
