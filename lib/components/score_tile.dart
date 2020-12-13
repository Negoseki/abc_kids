import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/models/user_score.dart';
import 'package:flutter/material.dart';

class ScoreTile extends StatelessWidget {
  UserScore userScore;
  ScoreTile({@required this.userScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.TEXT_BACKGROUND,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black26,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
        border: Border.all(
          color: AppColors.INPUT_BACKGROUND,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${userScore.name} - ${userScore.age}',
            style: TextStyle(
              color: AppColors.TEXT_GREY,
              fontSize: 40,
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  '${userScore.score}',
                  style: TextStyle(
                    color: AppColors.TEXT_GREY,
                    fontSize: 40,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
