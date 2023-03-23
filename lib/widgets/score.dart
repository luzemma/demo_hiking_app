import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  int score = 0;
  Score({required this.score, super.key});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.thumb_up,
            color: Colors.amberAccent,
          ),
          onPressed: () {
            setState(() => widget.score++);
          },
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "${widget.score}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          width: 2,
        ),
        IconButton(
          icon: const Icon(
            Icons.thumb_down,
            color: Colors.grey,
          ),
          onPressed: () {
            if (widget.score > 0) {
              setState(() => widget.score--);
            }
          },
        ),
      ],
    );
  }
}
