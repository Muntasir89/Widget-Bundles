import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  final String title;

  const PageViewWidget({super.key, required this.title});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: PageView(
        children: [
          FirstPage(),
          SecondPage()
        ]
      )
    );
  }

  Container SecondPage() {
    return Container(
          color: Colors.orange,
          child: const Center(
              child: Text(
                "Page 2",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60
              ),
            )
          ),
        );
  }

  Container FirstPage() {
    return Container(
          color: Colors.blue,
          child: const Center(
            child: Text(
              "Page 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60
              ),
            ),
          ),
        );
  }
}
