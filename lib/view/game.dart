import 'dart:math';

import 'package:abc_kids/components/app_button.dart';
import 'package:abc_kids/components/game_win.dart';
import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/data/game1_objects.dart';
import 'package:abc_kids/models/game1_object.dart';
import 'package:abc_kids/models/user_score.dart';
import 'package:abc_kids/providers/user_score_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'games/game_1.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Game1Object> game1Objects;
  int _totalScore = 0;
  Widget wGame;
  UserScore userScore;
  _GameState() {
    game1Objects = List.of(Game1ObjectList);
    wGame = getRandomGame();
  }

  Widget getRandomGame() {
    int gameLength = game1Objects.length - 1;
    int indexGame = gameLength > 0 ? Random().nextInt(gameLength) : 0;
    return Game1(
      onWinGame: (score) => winGame(indexGame, score),
      gameObj: game1Objects[indexGame],
    );
  }

  winGame(int indexGame, int score) {
    game1Objects.removeAt(indexGame);
    _totalScore += score;
    if (game1Objects.length > 0) {
      startNewGame();
    } else {
      finishGame();
    }
  }

  finishGame() {
    setState(() {
      Future.delayed(Duration.zero, () {
        showDialog(
          barrierColor: null,
          context: context,
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.INPUT_BACKGROUND, width: 10),
                    color: AppColors.TEXT_BACKGROUND,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                        child: Center(
                          child: Text(
                            'Parabéns!',
                            style: TextStyle(
                              color: AppColors.TEXT_GREY,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Sua Pontuação é:',
                          style: TextStyle(
                            color: AppColors.TEXT_GREY,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 80,
                          ),
                          Text(
                            '$_totalScore',
                            style: TextStyle(
                              fontSize: 60,
                              color: AppColors.TEXT_GREY,
                            ),
                          ),
                        ],
                      ),
                      AppButton(
                        fillColor: AppColors.BUTTON_BLUE,
                        icon: Icons.arrow_back_ios,
                        text: 'Voltar',
                        onPressed: () {
                          userScore.score = _totalScore;
                          Provider.of<UserScoresProvider>(
                            context,
                            listen: false,
                          ).addScore(userScore);
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName('/'));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  startNewGame() {
    setState(() {
      Future.delayed(Duration.zero, () {
        showDialog(
          barrierColor: null,
          context: context,
          child: GameWin(
            onPressed: () {
              setState(() {
                wGame = null;
                Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    wGame = getRandomGame();
                  });
                });
              });
              Navigator.pop(context, true);
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    userScore = ModalRoute.of(context).settings.arguments;
    return Stack(
      children: [
        Container(
          color: AppColors.YELLOW_BACKGROUND_1,
          child: wGame,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: AppButton(
            fillColor: Colors.blue,
            onPressed: () => {Navigator.of(context).pop()},
            icon: Icons.arrow_back_ios,
            width: 60,
          ),
        ),
      ],
    );
  }
}
