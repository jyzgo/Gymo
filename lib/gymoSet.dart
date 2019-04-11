import 'package:flutter/material.dart';
import 'GymoObserverEnum.dart';

class GymoSet extends StatefulWidget {
  @override
  _GymoSetState createState() => _GymoSetState();
}

class _GymoSetState extends State<GymoSet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: <Widget>[
          FlatButton(
            child: const Icon(Icons.add),
            onPressed: () {
              ObserverCenter.post(
                  GymoNotificationEnum.SetNumberChanged.index, 1);
            },
          ),
          FlatButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              ObserverCenter.post(
                  GymoNotificationEnum.SetNumberChanged.index, -1);
            },
          )
        ],
      ),
    );
  }
}
