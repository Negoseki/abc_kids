import 'package:flutter/material.dart';

class UserScore {
  String name;
  int age;
  int score;
  UserScore({
    @required this.name,
    @required this.age,
    @required this.score,
  });

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['name'] = name;
    m['age'] = age;
    m['score'] = score;
    return m;
  }
}
