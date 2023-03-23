import 'package:flutter/material.dart';

class BottomBarItemIcon extends StatelessWidget {
  final String assetName;
  const BottomBarItemIcon(this.assetName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
      child: Image.asset(
        "assets/images/$assetName",
      ),
    );
  }
}
