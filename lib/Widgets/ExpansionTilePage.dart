import 'package:flutter/material.dart';

class ExpansionPage extends StatefulWidget {
  final String title;
  const ExpansionPage({super.key, required this.title});

  @override
  State<ExpansionPage> createState() => _ExpansionPageState();
}

class _ExpansionPageState extends State<ExpansionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ExpansionTile(
        title: Text("See more"),
        leading: Icon(Icons.info),
        backgroundColor: Colors.black12,
        children: <Widget>[
          ListTile(title: Text('First')),
          ListTile(title: Text('Second')),
          ListTile(title: Text('Third')),
        ],
      ),
    );
  }
}
