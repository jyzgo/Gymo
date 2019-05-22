import 'package:flutter/material.dart';
import 'package:gymo/Model/WorkoutDetailModel.dart';
import './WorkoutDetailPage.dart';

class WorkoutSelection extends StatefulWidget {
  @override
  _WorkoutSelectionState createState() => _WorkoutSelectionState();
}

class _WorkoutSelectionState extends State<WorkoutSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topAppBar,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        body: makeBody());
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text("Seclect Workout"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      )
    ],
  );

  void onInfoButtonPressed(WorkoutDetailModel model) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WorkoutDetailPage(
                  detailModel: model,
                )));
  }

  ListTile makeListTile(WorkoutDetailModel model) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: IconButton(
                icon: Icon(Icons.info_outline, color: Colors.white),
                onPressed: () {
                  onInfoButtonPressed(model);
                })),
        title: Text(
          model.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(model.level, style: TextStyle(color: Colors.white))
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              addWorkout(model);
            },
            icon: Icon(Icons.add_circle, color: Colors.white, size: 30.0)));
  }

  void addWorkout(index) {
    Navigator.pop(context, index);
  }

  Card makeCard(WorkoutDetailModel model) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(model),
        ),
      );

  Container makeBody() => Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: totalWorkouts.length,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(totalWorkouts[index]);
          },
        ),
      );
}
