import 'package:abc_kids/components/app_button.dart';
import 'package:abc_kids/components/home_background.dart';
import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/routes/app_routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBackground(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
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
                    onPressed: () => {},
                    fillColor: AppColors.BUTTON_BLUE,
                    text: "PONTUAÇÃO",
                    icon: Icons.poll,
                    width: 300,
                  ),
                ],
              ),
              AppButton(
                onPressed: () => {},
                fillColor: AppColors.BUTTON_RED,
                text: "SAIR",
                icon: Icons.close,
                width: 150,
              )
            ],
          ),
        ),
      ],
    );
  }
}
