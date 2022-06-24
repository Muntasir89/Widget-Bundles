import 'package:flutter/material.dart';

class HeroWidgetStart extends StatelessWidget {
  final String title;

  const HeroWidgetStart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroWidgetStart"),
      ),
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HeroWidgetEnd()
            )
          );
        },
        child: Center(
          child:Hero(
            tag: "tag",
            child: Image.asset("assets/image.jpeg", height: 200, width: 200)
          ),
        ),
      ),
    );
  }
}
//Hero Destination Widget
class HeroWidgetEnd extends StatelessWidget {
  const HeroWidgetEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroWidgetEnd"),
      ),
      body: Center(
        child: Hero(
          tag: "tag",
          child: Image.asset("assets/image.jpeg"),
        ),
      )
    );
  }
}

