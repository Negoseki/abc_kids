import 'package:abc_kids/components/app_button.dart';
import 'package:abc_kids/components/home_background.dart';
import 'package:abc_kids/components/score_tile.dart';
import 'package:abc_kids/providers/user_score_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserScoresProvider userScores = Provider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          HomeBackground(),
          Padding(
            padding: EdgeInsets.all(10),
            child: AppButton(
              fillColor: Colors.blue,
              onPressed: () => {Navigator.of(context).pop()},
              icon: Icons.arrow_back_ios,
              width: 60,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(100, 10, 80, 0),
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: userScores.count,
              itemBuilder: (ctx, i) =>
                  ScoreTile(userScore: userScores.byIndex(i)),
            ),
          )
        ],
      ),
    );
  }
}
