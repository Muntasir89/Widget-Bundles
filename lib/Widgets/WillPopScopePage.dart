import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatefulWidget {
  const WillPopScopeWidget({Key? key}) : super(key: key);

  @override
  State<WillPopScopeWidget> createState() => _WillPopScopeWidgetState();
}

class _WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text("WillPopScope"),
        ),
        body: const Center(),
      ),
    );
  }
}
