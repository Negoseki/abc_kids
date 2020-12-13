import 'package:abc_kids/models/user_score.dart';

class UserScoreItens {
  List<UserScore> items;

  UserScoreItens() {
    items = new List();
  }

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
