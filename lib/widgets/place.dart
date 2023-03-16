import 'dart:math';

import 'package:demo_lakes/widgets/carousel.dart';
import 'package:demo_lakes/widgets/score.dart';
import 'package:demo_lakes/widgets/text_icon_button.dart';
import 'package:flutter/material.dart';

class Place extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final int score;
  final List<String> imagesUrl;
  const Place(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.score,
      required this.imagesUrl,
      super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = Random().nextInt(widget.imagesUrl.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image(
                  image: NetworkImage(widget.imagesUrl[selectedIndex]),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: Carousel(
                images: widget.imagesUrl,
                callback: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.subtitle,
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Score(
                score: widget.score,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextIconButton(icon: Icons.call, text: "Call", onPressed: () {}),
            TextIconButton(
                icon: Icons.location_pin, text: "Route", onPressed: () {}),
            TextIconButton(icon: Icons.share, text: "Share", onPressed: () {}),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            widget.description,
            style: textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
