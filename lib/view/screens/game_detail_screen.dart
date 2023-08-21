import 'package:flutter/material.dart';

class GameDetailScreen extends StatefulWidget {
  String? gameCode;
  GameDetailScreen({super.key, this.gameCode});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.gameCode!.toString());
  }
}
