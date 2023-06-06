import 'package:all_widget/Widgets/Provider/DataClass.dart';
import 'package:all_widget/Widgets/Provider/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ProviderClass extends StatelessWidget {
  const ProviderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => DataClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: ProviderDemoScreen(),
      )
    );
  }
}

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  State<ProviderDemoScreen> createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: postModel.loading? Center(
          child: SpinKitThreeBounce(
            itemBuilder: (BuildContext context, int index){
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: index.isEven ? Colors.red : Colors.green
                ),
              );
            },
          ),
        ): Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  postModel.post?.title ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                child: Text(postModel.post?.body ?? ""),
              )
            ],
          ),
        )
      ),
    );
  }


}
