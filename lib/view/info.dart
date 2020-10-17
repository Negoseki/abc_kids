import 'package:abc_kids/components/app_button.dart';
import 'package:abc_kids/components/home_background.dart';
import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.TEXT_GREY,
                        ),
                        children: [
                          TextSpan(text: "Qual é o seu "),
                          TextSpan(
                            text: "NOME",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "?"),
                        ],
                      ),
                    ),
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: AppColors.INPUT_BACKGROUND,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.TEXT_GREY,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.TEXT_GREY,
                          ),
                          hintText: '_ _ _ _ _ _',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.TEXT_GREY,
                        ),
                        children: [
                          TextSpan(text: "Qual é a sua "),
                          TextSpan(
                            text: "IDADE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "?"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.INPUT_BACKGROUND,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.TEXT_GREY,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.TEXT_GREY,
                          ),
                          hintText: '_ _',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    AppButton(
                      onPressed: () =>
                          {Navigator.of(context).pushNamed(AppRoutes.GAME)},
                      fillColor: Colors.blue,
                      text: "JOGAR",
                      icon: Icons.play_arrow,
                      width: 300,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
