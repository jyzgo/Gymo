import 'package:flutter/material.dart';
import 'GymoObserverEnum.dart';

class GymoSet extends StatefulWidget {
  Function _leftfunc;
  Function _rightfunc;
  Text _text;
  GymoSet(this._text, this._leftfunc, this._rightfunc);

  @override
  _GymoSetState createState() =>
      _GymoSetState(this._text, this._leftfunc, this._rightfunc);
}

class _GymoSetState extends State<GymoSet> {
  Function _leftfunc;
  Function _rightfunc;
  Text _text;
  _GymoSetState(this._text, this._leftfunc, this._rightfunc);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      FlatButton(
        child: const Icon(
          Icons.add_circle,
          size: 50,
        ),
        onPressed: this._leftfunc,
      ),
      SafeArea(child: this._text),
      FlatButton(
          child: const Icon(
            Icons.remove_circle,
            size: 50,
          ),
          onPressed: this._rightfunc)
    ]);
  }
}
