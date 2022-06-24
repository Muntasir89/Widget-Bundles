import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final String title;

  const TimePicker({super.key, required this.title});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 12);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Text(
          '${time!.hour.toString()}:${time!.minute.toString()}',
          style: const TextStyle(fontSize: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.access_time_outlined,
        ),
        onPressed: () async {
          TimeOfDay? newTime = await showTimePicker(context: context, initialTime: time!);
          if(newTime != null){
            setState((){
              time = newTime;
            });
          }
        },
      ),
    );
  }
}
