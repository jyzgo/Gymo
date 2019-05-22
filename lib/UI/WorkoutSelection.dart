import 'package:flutter/material.dart';


class WorkoutSelection extends StatefulWidget {
  @override
  _WorkoutSelectionState createState() => _WorkoutSelectionState();
}

class _WorkoutSelectionState extends State<WorkoutSelection> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar:topAppBar, 
       backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    body:Container(child:
      ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
        return makeListTile(index);
       },
      ),
      
    )
    );
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


  void onInfoButtonPressed(int index)
  {
    print("info button pressed " + index.toString());

  }

  ListTile makeListTile(int index) {
        return  ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child:IconButton(icon: 
          Icon(Icons.info_outline, color: Colors.white),
          onPressed: (){
            onInfoButtonPressed(index);
          }
          )
        ),
        title: Text(
          "Back workout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" Intermediate", style: TextStyle(color: Colors.white))
          ],
        ),
        onTap: (){
          print("Tile be pressed " + index.toString());
        },
        trailing:
            Icon(Icons.add_circle, color: Colors.white, size: 30.0));

  }
}