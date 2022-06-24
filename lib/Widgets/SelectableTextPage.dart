import 'package:flutter/material.dart';

class SelectableTextPage extends StatefulWidget {
  final String title;

  const SelectableTextPage({super.key, required this.title});

  @override
  State<SelectableTextPage> createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
  String selectedText = "";
  final String _selectableText = "This is a selectable text";
  final TextStyle _styleblue = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  final TextStyle _style = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)
              ),
              child: Text(
                selectedText,
                style: _styleblue,
              ),
            ),
            TextSelectionTheme(
                data: const TextSelectionThemeData(
                  selectionColor: Colors.yellow
                ),
                child:SelectableText(
                  _selectableText,
                  style: _style,
                  onSelectionChanged: (selection, cause){
                    setState((){
                      selectedText = _selectableText.substring(
                        selection.start,
                        selection.end
                      );
                    });
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
