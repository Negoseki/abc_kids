class Game1Object {
  final String name;
  final String imageUrl;
  Game1Object(name, imageUrl)
      : name = name,
        imageUrl = imageUrl;

  List<String> getLetters() {
    return name.toString().split('');
  }
}
