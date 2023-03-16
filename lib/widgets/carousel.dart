import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> images;
  const Carousel({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black54,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _getImagesWidgets(),
        ),
      ),
    );
  }

  List<Widget> _getImagesWidgets() {
    return images
        .map(
          (item) => Image(
            image: NetworkImage(item),
          ),
        )
        .toList();
  }
}
