import 'package:abc_kids/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'home_background_painter.dart';

class HomeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Container(
          child: RotatedBox(
            quarterTurns: 2,
            child: CustomPaint(
              child: Container(),
              painter: CurvePainter(
                color: AppColors.YELLOW_BACKGROUND_1,
                heightStart: 0.5,
                heightEnd: 1,
                widthEnd: 0.8,
              ),
            ),
          ),
        ),
        Container(
          child: RotatedBox(
            quarterTurns: 2,
            child: CustomPaint(
              child: Container(),
              painter: CurvePainter(
                color: AppColors.YELLOW_BACKGROUND_2,
                heightStart: 0.3,
                heightEnd: 1,
              ),
            ),
          ),
        ),
        Container(
          child: RotatedBox(
            quarterTurns: 2,
            child: CustomPaint(
              child: Container(),
              painter: CurvePainter(
                color: AppColors.YELLOW_BACKGROUND_3,
                heightStart: 0.05,
                heightEnd: 0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
