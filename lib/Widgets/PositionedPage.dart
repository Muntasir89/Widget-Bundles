import 'package:flutter/material.dart';

class PositionedWidget extends StatefulWidget {
  const PositionedWidget({Key? key}) : super(key: key);

  @override
  State<PositionedWidget> createState() => _PositionedWidgetState();
}

class _PositionedWidgetState extends State<PositionedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Positioned Widget"),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
                left: 40,
                top: 40,
                child: Image.asset(
                  "assets/image.jpeg",
                  width: 250,
                )
            ),
            Positioned(
                left: 80,
                top: 80,
                child: Image.asset(
                  "assets/image.jpeg",
                  width: 250,
                )
            )
          ],
        ),
      ),
    );
  }
}
