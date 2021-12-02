import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

import 'ball.dart';

class GameApp extends FlameGame with HasDraggables, HasCollidables {
  @override
  Color backgroundColor() {
    return const Color(0xFF888888);
  }

  @override
  Future<void>? onLoad() {
    final ball = Ball();
    add(ball);
    return super.onLoad();
  }
}
