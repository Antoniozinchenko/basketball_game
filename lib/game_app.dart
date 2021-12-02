import 'package:flame/game.dart';

import 'ball.dart';

class GameApp extends FlameGame {
  @override
  Future<void>? onLoad() {
    final ball = Ball()
      ..x = size.x / 4
      ..y = size.y * 0.8;
    add(ball);
    return super.onLoad();
  }
}
