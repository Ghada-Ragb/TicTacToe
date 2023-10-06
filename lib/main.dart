import 'package:flutter/material.dart';
import 'package:tic_tac_toe/TicTacToc.dart';

void main() {
  runApp(const TicTacToc_Game());
}

class TicTacToc_Game extends StatelessWidget {
  const TicTacToc_Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToc(),
    );
  }
}
