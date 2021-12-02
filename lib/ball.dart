import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Ball extends PositionComponent with HasGameRef {
  static const gravity = 800;

  double speedY = -800;
  double speedX = 300;
  @override
  double get height => 60;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(const Offset(0, 0), height / 2, BasicPalette.red.paint());
  }

  @override
  void update(double dt) {
    if (speedX.abs() > 10) {
      final nextY = y + speedY * dt;

      final nextX = x + speedX * dt;

      if (nextX > height / 2 && nextX < gameRef.size.x - height / 2) {
        x = nextX;
      } else {
        speedX = -speedX;
      }

      if ((nextY < gameRef.size.y - height / 2) && nextY > 0) {
        y = nextY;
        speedY += gravity * dt;
      } else {
        speedY *= -0.8;
        speedX *= 0.8;
      }
    }

    super.update(dt);
  }
}
