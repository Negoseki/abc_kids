import 'package:abc_kids/components/app_button.dart';
import 'package:abc_kids/components/home_background.dart';
import 'package:abc_kids/helpers/colors.dart';
import 'package:abc_kids/models/user_score.dart';
import 'package:abc_kids/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String name = '';
  String age = '';
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  bool isButtonEnable = false;

  void _checkButtonEnable() {
    setState(() {
      isButtonEnable =
          name.trim() != '' && age.trim() != '' && name != null && age != null;
    });
  }

  _InfoState() {
    getUserandAge();
  }

  saveUserandAge(String userName, int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', userName);
    prefs.setInt('age', age);
  }

  getUserandAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefName = prefs.getString('user');
    int prefAge = prefs.getInt('age');
    if (prefName != null && prefAge != null) {
      setState(() {
        txtName.text = prefName;
        txtAge.text = prefAge.toString();
        name = prefName;
        age = prefAge.toString();
        _checkButtonEnable();
      });
    }
  }

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
                        controller: txtName,
                        onChanged: (value) {
                          name = value;
                          _checkButtonEnable();
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
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
                        controller: txtAge,
                        onChanged: (value) {
                          age = value;
                          _checkButtonEnable();
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
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
                      onPressed: () {
                        if (isButtonEnable) {
                          saveUserandAge(name.trim(), int.parse(age.trim()));
                          Navigator.of(context).pushNamed(
                            AppRoutes.GAME,
                            arguments: UserScore(
                                age: int.parse(age.trim()),
                                name: name.trim(),
                                score: 0),
                          );
                        }
                      },
                      fillColor: isButtonEnable
                          ? AppColors.BUTTON_BLUE
                          : AppColors.BUTTON_BLUE.withOpacity(0.25),
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
