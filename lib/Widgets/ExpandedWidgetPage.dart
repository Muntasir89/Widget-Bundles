import 'package:flutter/material.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({Key? key}) : super(key: key);
  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Widget")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  height: 200,
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.orange,
                  height: 200,
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  height: 200,
                )
            )
          ],
        ),
      ),
    );
  }
}