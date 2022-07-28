import 'package:flutter/material.dart';

class InkWellPage extends StatefulWidget {
  const InkWellPage({Key? key}) : super(key: key);

  @override
  State<InkWellPage> createState() => _InkWellPageState();
}

class _InkWellPageState extends State<InkWellPage> {
  String title = "First Page";
  String firstPage = "First Page";
  String secondPage = "Second Page";
  Color boxColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Text(firstPage),
                    value: firstPage,
                ),
                PopupMenuItem(
                  child: Text(secondPage),
                  value: secondPage,
                )
              ],
            onSelected: (String newValue){
                setState((){
                  title = newValue;
                });
            }
          )
        ]
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            InkWell(
              onDoubleTap: (){
                setState((){
                  boxColor = Colors.red;
                });
              },
              onLongPress: (){
                setState((){
                  boxColor = Colors.yellow;
                });
              },
              onTap: (){
                setState((){
                  boxColor = Colors.blue;
                });
              },
              child: Ink(
                height: 200,
                width: 200,
                color: boxColor,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text('Flutter Mapp'),
                        contentPadding: const EdgeInsets.all(20.0),
                        children: <Widget>[
                          const Text('More Information'),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          )
                        ],
                      )
                  );
                },
                child: const Text('show Dialog')
            )
          ],
        ),
      ),
    );
  }
}

