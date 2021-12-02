import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

final random = Random();

class Ball extends SpriteComponent with HasGameRef, Draggable {
  static const gravity = 800;
  static const ballRadius = 30.0;

  double speedY = 0;
  double speedX = 0;

  double pointerOffsetY = 0;
  double pointerOffsetX = 0;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('ball.png');
    height = ballRadius * 2;
    width = ballRadius * 2;
    x = random.nextDouble() * (gameRef.size.x - (ballRadius * 2)) + ballRadius;
    y = random.nextDouble() * (gameRef.size.y - (ballRadius * 2)) + ballRadius;
    return super.onLoad();
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    pointerOffsetX += info.raw.delta.dx;
    pointerOffsetY += info.raw.delta.dy;
    return super.onDragUpdate(pointerId, info);
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo info) {
    speedX = pointerOffsetX * 5;
    speedY = pointerOffsetY * 5;
    pointerOffsetX = 0;
    pointerOffsetY = 0;
    return super.onDragEnd(pointerId, info);
  }

  @override
  void render(Canvas canvas) {
    const ballOffset = Offset(ballRadius, ballRadius);
    final pointerOffset = Offset(
      ballRadius + pointerOffsetX,
      ballRadius + pointerOffsetY,
    );
    if (pointerOffsetX != 0 || pointerOffsetY != 0) {
      canvas.drawLine(ballOffset, pointerOffset, BasicPalette.white.paint());
      canvas.drawCircle(pointerOffset, 15, BasicPalette.white.paint());
    }
    super.render(canvas);
  }

  @override
  void update(double dt) {
    if (speedY == 0 && speedY == 0) {
      return super.update(dt);
    }
    if (speedX.abs() > 10 || speedY.abs() > 10) {
      final nextY = y + speedY * dt;

      final nextX = x + speedX * dt;

      if (nextX > 0 && nextX < gameRef.size.x - (ballRadius * 2)) {
        x = nextX;
      } else {
        speedX = -speedX;
      }

      if ((nextY < gameRef.size.y - ballRadius * 2) && nextY > 0) {
        y = nextY;
        speedY += gravity * dt;
      } else {
        speedY *= -0.8;
        speedX *= 0.8;
      }
    } else {
      gameRef.add(Ball());
      gameRef.remove(this);
    }
    super.update(dt);
  }
}
