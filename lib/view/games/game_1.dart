import 'dart:async';
import 'dart:math';

import 'package:abc_kids/components/app_drag_button.dart';
import 'package:abc_kids/components/app_drag_target.dart';
import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/models/game1_object.dart';
import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  final Function(int) onWinGame;
  final Game1Object gameObj;
  Game1({@required this.onWinGame, @required this.gameObj});

  @override
  _Game1State createState() =>
      _Game1State(onWinGame: onWinGame, gameObj: gameObj);
}

class _Game1State extends State<Game1> {
  Game1Object gameObj;
  List<Widget> dragButtons;
  List<Widget> dragTargets;

  Timer _timer;
  int _gameTime = 0;

  final Function(int) onWinGame;
  int lettersAccepted = 0;
  _Game1State({@required this.onWinGame, @required this.gameObj}) {
    startTimer();
  }

  void _checkWinGame() {
    lettersAccepted++;
    if (lettersAccepted >= dragTargets.length) {
      _timer.cancel();
      int score = (dragButtons.length * 100) - (_gameTime * 10);
      onWinGame(score > 50 ? score : 50);
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        _gameTime++;
      },
    );
  }

  void _createDragCells(BuildContext context) {
    dragButtons = [];
    dragTargets = [];
    if (gameObj != null) {
      List<String> letters = gameObj.getLetters();
      double dragButtonsSize =
          (MediaQuery.of(context).size.height / letters.length) - 10.0;
      dragButtonsSize = dragButtonsSize > 60.0 ? 60.0 : dragButtonsSize;

      letters.forEach((l) {
        bool accepted = false;
        Widget wTarget = Padding(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: DragTarget<String>(
            builder: (context, List<String> candidateData, rejectedData) {
              return accepted
                  ? AppDragButton(
                      text: l,
                      width: dragButtonsSize,
                      height: dragButtonsSize,
                      fillColor: AppColors.BUTTON_BLUE,
                    )
                  : AppDragTarget(
                      height: dragButtonsSize,
                      width: dragButtonsSize,
                    );
            },
            onWillAccept: (data) {
              if (data == l) {
                return true;
              } else {
                return false;
              }
            },
            onAccept: (data) {
              if (data == l) {
                accepted = true;
                _checkWinGame();
              }
            },
          ),
        );
        dragTargets.add(wTarget);
      });

      letters.shuffle(Random());
      letters.asMap().forEach((i, l) {
        bool isLeft = i % 2 == 0;
        Widget wDrag = Padding(
          padding: EdgeInsets.only(
            top: 5,
            left: isLeft ? 0 : 100,
          ),
          child: Draggable<String>(
            childWhenDragging: Container(
              width: dragButtonsSize,
              height: dragButtonsSize,
              color: Colors.transparent,
            ),
            data: l,
            onDragCompleted: () {
              setState(() {
                dragButtons[i] = Opacity(
                  opacity: 0.0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: isLeft ? 0 : 100,
                    ),
                    child: Container(
                      width: dragButtonsSize,
                      height: dragButtonsSize,
                    ),
                  ),
                );
              });
            },
            child: AppDragButton(
              text: l,
              width: dragButtonsSize,
              height: dragButtonsSize,
              fillColor: AppColors.BUTTON_BLUE,
            ),
            feedback: AppDragButton(
              text: l,
              width: dragButtonsSize,
              height: dragButtonsSize,
              fillColor: AppColors.BUTTON_BLUE,
            ),
          ),
        );
        dragButtons.add(wDrag);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dragButtons == null) {
      _createDragCells(context);
    }
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dragButtons != null ? dragButtons : [],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 400,
                height: 200,
                child: gameObj != null ? Image.asset(gameObj.imageUrl) : '',
              ),
              Row(
                children: dragTargets != null ? dragTargets : [],
              )
            ],
          ),
        ],
      ),
    );
  }
}
