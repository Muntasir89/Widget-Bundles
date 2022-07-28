import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  bool selected = false;
  //Animated_Default_TextStyle
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;
  //Animated_Icon
  bool _isPlay = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
  )
    ..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Animations"),),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                Animatedalign(),
                Animatedbuilder(),
                Animatedcontainer(),
                Animated_Cross_Fade(),
                Animated_Default_TextStyle(),
                Animated_Icon()
              ],
            )
        ),
      )
    );
  }

  Animatedalign() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: double.infinity,
          height: 250.0,
          color: Colors.blueGrey,
          child: AnimatedAlign(
            alignment:
            selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
  Animatedbuilder() {
    return AnimatedBuilder(
      animation: _controller,
      child: const FlutterLogo(
        size: 100,
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
  Animatedcontainer(){
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
            child: AnimatedContainer(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              duration: const Duration(seconds: 2),
              color: selected ? Colors.blueGrey : Colors.white,
              alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            )
        )
    );
  }
  Animated_Cross_Fade() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
            width: double.infinity,
            height: 100,
        ),
        TextButton(
          onPressed: (){
            setState((){
              selected = !selected;
            });
          },
          child: const Text(
            "Switch",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Image.asset(
              'assets/image.jpeg',
              width: double.infinity
          ),
          secondChild: Image.asset(
            'assets/image2.jpg',
            width: double.infinity,
          ),
          crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
      ],
    );
  }
  Animated_Default_TextStyle(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 120,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: _fontSize,
              color: _color,
              fontWeight: FontWeight.bold
            ),
            child: const Text("Flutter"),
          ),
        ),
        TextButton(
            onPressed: (){
              setState((){
                _fontSize = _first ? 90 : 60;
                _color = _first ? Colors.blue : Colors.red;
                _first = !_first;
              });
            },
            child: const Text(
              "Switch"
            )
        )
      ],

    );
  }
  Animated_Icon(){
    return Center(
      child: GestureDetector(
        onTap: (){
          if(_isPlay == false){
            _controller.forward();
            _isPlay = true;
          }else{
            _controller.reverse();
            _isPlay = false;
          }
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _controller,
          size: 100,
          color: Colors.black,
        ),
      ),
    );
  }
}