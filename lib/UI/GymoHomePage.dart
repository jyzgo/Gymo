
import 'dart:io';
import 'package:flutter/material.dart';
import './NewPlan.dart';
import '../utils/FileManager.dart';

class GymoHomePage extends StatefulWidget {
  GymoHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GymoHomePageState createState() => _GymoHomePageState();
}

class _GymoHomePageState extends State<GymoHomePage> {
  static const String JSON_FILE = 'gymo.json';
  static const String ARRAY_KEY = 'arrays';
  static const String TITLE_KEY = 'title';
  List<Map<String, dynamic>> _plans;
  _GymoHomePageState() {
    _loadFile();
  }

  _loadFile() async {
    var file = File(JSON_FILE);
    if (await file.exists()) {
      FileManager().readJson(JSON_FILE).then((mainMap) => {
            setState(() {
              if (mainMap[ARRAY_KEY] == null) {
                mainMap[ARRAY_KEY] = List<Map<String, dynamic>>();
              }
              _plans = mainMap[ARRAY_KEY];
            })
          });
    } else {
      _plans = List<Map<String, dynamic>>();
    }
  }

  List<Widget> _cellList() {
    if (_plans != null) {
      return _plans
          .map((plan) => ListTile(title: Text(plan[TITLE_KEY])))
          .toList();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Open setting',
              onPressed: () {
                print('Setting pressed');
              })
        ],
      ),
      body: Center(
          child: _plans != null && _plans.length != 0
              ? ListView(
                  children: _cellList(),
                )
              : Text('Add A New Plan',
                  style: TextStyle(fontSize: 40, color: Colors.black))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewPlanPage()))
              .then((v) => {_dealWithReturnValue(v)});

          // NewPlanRoute())
          //     .then((value) => {print('value is $value')});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _dealWithReturnValue(v) {
    if (v != null) {
      setState(() {
        _plans.add(v);
      });
    }
  }
}