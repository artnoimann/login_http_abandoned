import 'dart:convert';

class GameModel {
  final String name;
  final String gameType;
  final double price;
  final bool available;
  // final String _userSession = '';
  final bool payed = false;
  final String img;

  GameModel({
    required this.name,
    required this.gameType,
    required this.price,
    required this.available,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gameType': gameType,
      'price': price,
      'available': available,
      'img': img,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      name: map['name'] as String,
      gameType: map['gameType'] as String,
      price: map['price'] as double,
      available: map['available'] as bool,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
