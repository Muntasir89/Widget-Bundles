import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Widget")
      ),
      body: Center(
        child: Stepper(
          steps: const [
            Step(
              title: Text("Step 1"),
              content: Text("Information for step 1")
            ),
            Step(
                title: Text("Step 2"),
                content: Text("Information for step 2")
            ),
            Step(
                title: Text("Step 3"),
                content: Text("Information for step 3")
            )
          ],
          onStepTapped: (int newIndex){
            setState((){
              _currentStep = newIndex;
            });
          },
          onStepContinue: (){
            if(_currentStep != 2){
              setState((){
                _currentStep += 1;
              });
            }
          },
          onStepCancel: (){
            if(_currentStep != 0){
              setState((){
                _currentStep -= 1;
              });
            }
          },
          currentStep: _currentStep,
        )
      )
    );
  }
}
