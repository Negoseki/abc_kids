import 'package:abc_kids/components/app_button.dart';
import 'package:abc_kids/components/home_background.dart';
import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  Widget titleElement(
      String letter, double posX, double posY, int rotation, Color color) {
    return Positioned(
      top: posY,
      left: posX,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(rotation / 360),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: Color.alphaBlend(
                    Colors.white.withOpacity(0.25),
                    color,
                  ),
                ),
                BoxShadow(
                  color: color,
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(-4, -4),
                ),
              ]),
          alignment: Alignment.center,
          child: Text(
            letter,
            style: TextStyle(
              fontSize: 70,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          HomeBackground(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        AppButton(
                          onPressed: () =>
                              {Navigator.of(context).pushNamed(AppRoutes.INFO)},
                          fillColor: AppColors.BUTTON_BLUE,
                          text: "JOGAR",
                          icon: Icons.play_arrow,
                          width: 300,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppButton(
                          onPressed: () => {
                            Navigator.of(context).pushNamed(AppRoutes.SCORE)
                          },
                          fillColor: AppColors.BUTTON_BLUE,
                          text: "PONTUAÇÃO",
                          icon: Icons.poll,
                          width: 300,
                        ),
                      ],
                    ),
                    AppButton(
                      onPressed: () => {SystemNavigator.pop()},
                      fillColor: AppColors.BUTTON_RED,
                      text: "SAIR",
                      icon: Icons.close,
                      width: 150,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: 120,
                      child: Stack(
                        children: [
                          titleElement(
                              "A", 0.0, 10.0, 15, AppColors.BUTTON_BLUE),
                          titleElement(
                              "B", 100.0, 0.0, -15, AppColors.BUTTON_RED),
                          titleElement(
                              "C", 200.0, 20.0, 20, AppColors.BUTTON_GREEN)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "K",
                          style: TextStyle(
                            fontSize: 60,
                            color: AppColors.BUTTON_RED,
                          ),
                        ),
                        Text(
                          "i",
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "d",
                          style: TextStyle(
                            fontSize: 60,
                            color: AppColors.BUTTON_GREEN,
                          ),
                        ),
                        Text(
                          "s",
                          style: TextStyle(
                            fontSize: 60,
                            color: AppColors.BUTTON_BLUE,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
