import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class CatchTheNut extends StatelessWidget {
  const CatchTheNut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return CatchTheNutGame().widget;
    return Container();
  }
}

class _CatchTheNutGame extends BaseGame {
  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    super.update(t);
  }
}

class _Nut extends SpriteComponent{
  
}

//QuizIntro(name: 'Catch the Correct Nuts',text2: "Match the following",text3: "Move the Squirrel to catch the correct answers!\n\nCatch all the correct answers to finish the game.",)))
