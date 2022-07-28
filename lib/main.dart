import 'package:all_widget/Widgets/AnimatedCrossFadePage.dart';
import 'package:all_widget/Widgets/BottomNavPage.dart';
import 'package:all_widget/Widgets/ExpandedWidgetPage.dart';
import 'package:all_widget/Widgets/FittedBoxPage.dart';
import 'package:all_widget/Widgets/FutureBuilderPage.dart';
import 'package:all_widget/Widgets/GridPaperPage.dart';
import 'package:all_widget/Widgets/HeroWidgetPage.dart';
import 'package:all_widget/Widgets/PageViewPage.dart';
import 'package:all_widget/Widgets/PositionedPage.dart';
import 'package:all_widget/Widgets/SilverAppBar.dart';
import 'package:all_widget/Widgets/StepperWidgetPage.dart';
import 'package:all_widget/Widgets/StreamBuilderPage.dart';
import 'package:all_widget/Widgets/TimePickerPage.dart';
import 'package:all_widget/Widgets/WillPopScopePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:all_widget/ProductDataModel.dart';
import 'package:all_widget/Widgets/InkWell.dart';
import 'package:all_widget/Widgets/SelectableTextPage.dart';

import 'Widgets/Animations.dart';
import 'Widgets/ExpansionTilePage.dart';
import 'Widgets/WrapWidgetPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Widgets Collection'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ProductDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString("jsonfile/productlist.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data){
            if(data.hasError){
              return Center(child:Text("${data.error}"));
            }else if(data.hasData){
              var items = data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0: items.length,
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 58,
                              child: Center(
                                child:Text(items[index].index.toString(), style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                )),
                              )
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 8, right: 8), child:Text(items[index].name.toString(), style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),),),
                                    Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].about.toString(), style: TextStyle(
                                      fontSize: 16,
                                    ),),),
                                  ],
                                )
                              )
                            )
                          ],
                        ),
                        onTap: (){
                          ChooseRoute(context, items[index].name.toString());
                        },
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );
  }

  void ChooseRoute(BuildContext context, String string) {
    if(string == "WidgetClusters"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => InkWellPage()
      ));
    }else if(string == "Selectable Text"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => SelectableTextPage(title: string)
      ));
    }else if(string == "Hero Widget"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => HeroWidgetStart(title: string)
      ));
    }else if(string == "SilverAppBar"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => SilverAppBarWidget(title: string)
      ));
    }else if(string == "ExpansionTile"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ExpansionPage(title: string)
      ));
    }else if(string == "Wrap Widget"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => WrapWidget(title: string)
      ));
    }else if(string == "Time Picker"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => TimePicker(title: string)
      ));
    }else if(string == "PageView"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => PageViewWidget(title: string)
      ));
    }else if(string == "Bottom Navigation"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BottomNav()
      ));
    }else if(string == "Stepper Widget"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => StepperWidget()
      ));
    }else if(string == "Animated Cross Fade"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => AnimCrossFade()
      ));
    }else if(string == "Expanded Widget"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ExpandedWidget()
      ));
    }else if(string == "WillPopScope"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => WillPopScopeWidget()
      ));
    }else if(string == "FutureBuilder"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => FutureBuilderWidget()
      ));
    }else if(string == "StreamBuilder"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => StreamBuilderWidget()
      ));
    }else if(string == "GridPaper"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => GridPaperWidget()
      ));
    }else if(string == "FittedBox"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => FittedBoxWidget()
      ));
    }else if(string == "Positioned"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => PositionedWidget()
      ));
    }else if(string == "Animations"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Animations()
      ));
    }
  }
}
