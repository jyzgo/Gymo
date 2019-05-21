import 'package:flutter/material.dart';

class GymoSet extends StatefulWidget {
  final Function _onValueChanged;
  final int _timeCount;
  GymoSet(this._timeCount, this._onValueChanged);

  @override
  _GymoSetState createState() =>
      _GymoSetState(this._timeCount, this._onValueChanged);
}

class _GymoSetState extends State<GymoSet> {
  Function _onValueChanged;
  int _timeCount;
  _GymoSetState(this._timeCount, this._onValueChanged);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      FlatButton(
        child: const Icon(
          Icons.remove_circle,
          size: 80,
        ),
        onPressed: () {
          _valueChanged(-1);
        },
      ),
      SafeArea(
          child: Text(
        _timeCount.toString(),
        style: TextStyle(fontSize: 40, color: Colors.blueGrey),
      )),
      FlatButton(
          child: const Icon(
            Icons.add_circle,
            size: 80,
          ),
          onPressed: () {
            _valueChanged(1);
          })
    ]);
  }

  void _valueChanged(int v) {
    setState(() {
      _timeCount = _timeCount + v;
      _onValueChanged(v);
    });
  }
}
