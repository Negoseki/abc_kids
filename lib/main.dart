import 'package:abc_kids/providers/user_score_provider.dart';
import 'package:abc_kids/routes/app_routes.dart';
import 'package:abc_kids/view/game.dart';
import 'package:abc_kids/view/home.dart';
import 'package:abc_kids/view/info.dart';
import 'package:abc_kids/view/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  UserScoresProvider userScores = UserScoresProvider();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1))
        .then((value) => userScores.loadScores());
    return ChangeNotifierProvider(
      create: (context) => userScores,
      child: MaterialApp(
        title: 'ABC Kids',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => Home(),
          AppRoutes.INFO: (_) => Info(),
          AppRoutes.GAME: (_) => Game(),
          AppRoutes.SCORE: (_) => Score()
        },
      ),
    );
  }
}
