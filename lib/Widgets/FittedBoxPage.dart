import 'package:flutter/material.dart';

class FittedBoxWidget extends StatefulWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  @override
  State<FittedBoxWidget> createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 50,
          color: Colors.red,
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            child: Text(
              "FITTED BOX",
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
