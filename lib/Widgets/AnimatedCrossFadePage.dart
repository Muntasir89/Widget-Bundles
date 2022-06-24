import 'package:flutter/material.dart';

class AnimCrossFade extends StatefulWidget {
  const AnimCrossFade({Key? key}) : super(key: key);

  @override
  State<AnimCrossFade> createState() => _AnimCrossFadeState();
}

class _AnimCrossFadeState extends State<AnimCrossFade> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anim Cross Fade Widget"),
        actions: [
          TextButton(
            onPressed: () {
              setState((){
                _bool = !_bool;
              });
            },
            child: const Text(
              "Switch",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ),
        ]
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Image.asset('assets/image.jpeg', width: 350),
          secondChild: Image.asset('assets/image2.jpg', width: 200),
          crossFadeState: _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
      )
    );
  }
}
