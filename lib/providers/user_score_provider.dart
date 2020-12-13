import 'package:abc_kids/models/user_score.dart';
import 'package:abc_kids/models/user_score_itens.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class UserScoresProvider with ChangeNotifier {
  UserScoreItens _list = UserScoreItens();
  static const String STORAGE_KEY = 'user_scores.json';
  static const String STORAGE_ITEM = 'user_scores';
  final LocalStorage storage = new LocalStorage(STORAGE_KEY);

  List<UserScore> get all {
    return [..._list.items];
  }

  int get count {
    return _list.items.length;
  }

  UserScore byIndex(int i) {
    return _list.items.elementAt(i);
  }

  void loadScores() {
    List listItems = storage.getItem(STORAGE_ITEM);
    if (listItems != null) {
      _list.items = List<UserScore>.from(
        listItems.map(
          (item) => UserScore(
            name: item['name'],
            age: item['age'],
            score: item['score'],
          ),
        ),
      );
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(STORAGE_ITEM, _list.toJSONEncodable()).then((value) {
      print('lista salva: ');
      print(_list.toJSONEncodable());
    }).catchError((onError) {
      print('Error Save Score');
      print(onError);
    });
  }

  void addScore(UserScore userScore) {
    if (userScore == null) return;
    _list.items.add(userScore);
    _saveToStorage();
    notifyListeners();
  }

  Future<void> removeScore(int index) async {
    if (index == null) return;
    _list.items.removeAt(index);
    _saveToStorage();
    notifyListeners();
  }
}
