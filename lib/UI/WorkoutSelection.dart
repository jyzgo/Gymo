import 'package:flutter/material.dart';
class WorkoutSelection extends StatefulWidget {
  @override
  _WorkoutSelectionState createState() => _WorkoutSelectionState();
}

class _WorkoutSelectionState extends State<WorkoutSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(child:
      ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Text(index.toString()),
        );
       },
      ),
      
    );
  }
}