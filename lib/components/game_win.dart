import 'package:abc_kids/helpers/colors.dart';
import 'package:flutter/material.dart';

class GameWin extends StatelessWidget {
  GameWin({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: AppColors.INPUT_BACKGROUND, width: 10),
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
                      'Você acertou',
                      style: TextStyle(
                        color: AppColors.TEXT_GREY,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 145,
                    height: 145,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen, // AppColors.BUTTON_BLUE,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 5,
                          color: Color.alphaBlend(
                            Colors.white.withOpacity(0.25),
                            Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 120,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
