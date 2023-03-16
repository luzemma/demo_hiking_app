import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  const Score({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.thumb_up,
          color: Colors.amberAccent,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "$score",
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
