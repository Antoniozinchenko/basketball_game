import 'package:basket_game/game_app.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = GameApp();
    return MaterialApp(
      home: 
     Scaffold(
      appBar: AppBar(
        title: const Text('Basket Game'),
      ),
      body: GameWidget(game: game),
     ),  
    );
  }
}