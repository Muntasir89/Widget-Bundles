import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  final String title;

  const WrapWidget({super.key, required this.title});

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  @override
  Widget build(BuildContext context) {
    Widget _image = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/image.jpeg",
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
    List<Widget> _list = [_image,_image,_image,_image,_image,_image];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          children: _list,
        ),
      ),
    );
  }
}
