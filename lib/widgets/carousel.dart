import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> images;
  final Function callback;

  const Carousel({required this.images, required this.callback, super.key});

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
    List<Widget> result = [];
    for (var i = 0; i < images.length; i++) {
      result.add(
        GestureDetector(
          onTap: () => callback(i),
          child: Image(
            image: NetworkImage(images[i]),
          ),
        ),
      );
    }
    return result;
  }
}
