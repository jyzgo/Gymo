import 'package:flutter/material.dart';
import 'package:observe/observe.dart';

class GymoSet extends StatefulWidget {
  @override
  _GymoSetState createState() => _GymoSetState();
}

class _GymoSetState extends State<GymoSet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
