import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gymoSet.dart';
import 'GymoObserverEnum.dart';

class NewPlanRoute extends CupertinoPageRoute<NewPlanRoute> {
  NewPlanRoute() : super(builder: (BuildContext context) => new NewPlanPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
        position: new Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.0, 0.0),
        ).animate(secondaryAnimation),
        child: NewPlanPage());
  }
}

class NewPlanPage extends StatefulWidget {
  final Widget child;

  NewPlanPage({Key key, this.child}) : super(key: key);

  _NewPlanPageState createState() => _NewPlanPageState();
}

class _NewPlanPageState extends State<NewPlanPage> {
  String _planName;

  int _setsNum;
  int _worksNum;
  int _restInterval;

  _NewPlanPageState() {
    _LoadFromFile();
  }

  _LoadFromFile() {
    _planName = 'New Plan1';
    _setsNum = 20;
    _worksNum = 12;
    _restInterval = 30;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(_planName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This is gym Name',
                style: TextStyle(fontSize: 40, color: Colors.blueAccent),
              ),
              _gymTitleText('Sets'),
              GymoSet(_setsNum, _onSetValueChanged),
              _gymTitleText('Works Number'),
              GymoSet(_worksNum, _onWorksValueChanged),
              _gymTitleText('Rest Interval'),
              GymoSet(_restInterval, _onRestIntervalChanged),
              RaisedButton(
                child: Text('Save',
                    style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
                onPressed: () {
                  Navigator.pop(context);
                  print('save pressed');
                },
              )
            ],
          ),
        ));
  }

  Text _gymTitleText(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 35, color: Colors.lightBlueAccent),
    );
  }

  void _onSetValueChanged(int v) {
    _setsNum = _setsNum + v;
  }

  void _onWorksValueChanged(int v) {
    _worksNum = _worksNum + v;
  }

  void _onRestIntervalChanged(int v) {
    _restInterval = _restInterval + v;
  }

  @override
  notified(dynamic obj, int key) {
    int value = obj;
    var gmykey = GymoNotificationEnum.values[key];
    print("$gmykey value changed $value");
    switch (gmykey) {
      case GymoNotificationEnum.SetNumberChanged:
        {}
        break;
      case GymoNotificationEnum.WorkIntervalChanged:
        break;
      case GymoNotificationEnum.RestIntervalChanged:
        break;
    }
  }
}
