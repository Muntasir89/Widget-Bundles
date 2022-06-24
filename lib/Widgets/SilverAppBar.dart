import 'package:flutter/material.dart';

class SilverAppBarWidget extends StatefulWidget {
  final String title;


  const SilverAppBarWidget({super.key, required this.title});

  @override
  State<SilverAppBarWidget> createState() => _SilverAppBarWidgetState();
}

class _SilverAppBarWidgetState extends State<SilverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            floating: false,
            //snap: true,
            title: Text("Flutter"),
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Mapp"),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    "SLIVER",
                    style: TextStyle(fontSize: 600),
                  )
                ]
              )
          )
        ],
      ),
    );
  }
}

/*
class SilverAppBarWidget extends StatelessWidget {
  final String title;

  const SilverAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: false,
            snap: true,
            title: Text("Flutter"),
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Map'),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildDelegate(
                [
                  const Text(
                    "Sliver",
                    style: TextStyle(fontSize: 600),
                  )
                ]
              )
          )
        ],
      ),
    );
  }
}
*/