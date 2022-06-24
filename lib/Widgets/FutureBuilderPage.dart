import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

Future<String> getData() async{
  await Future.delayed(const Duration(seconds: 1));
  throw 'An Error occured';
  return "It works";
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator.adaptive();
            }
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else{
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    snapshot.data.toString(),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        setState((){

                        });
                      },
                      child: const Text('Refresh'),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
