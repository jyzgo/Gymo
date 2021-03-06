import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymo/Model/WorkoutDetailModel.dart';
import './gymoSet.dart';
import '../utils/FileManager.dart';
import './NewWorkout.dart';

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
  FocusNode _titleFocusNode;

  int _setsNum;
  int _worksNum;
  int _restInterval;

  @override
  void initState() {
    super.initState();

    _titleFocusNode = FocusNode();
  }

  _NewPlanPageState() {
    _loadFromFile();
  }

  _loadFromFile() {
    FileManager().readCounter().then((int value) {
      print('value I read is $value');
    });
    _planName = 'New PlandddR';
    _setsNum = 20;
    _worksNum = 12;
    _restInterval = 30;
  }

  TextEditingController _planNameController =
      TextEditingController(text: 'New Plan');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: createFloatingActionButton(),
        appBar: AppBar(
          title: titleEditable(), // Text(_planName ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print("Edit be pressed");
                FocusScope.of(context).requestFocus(_titleFocusNode);
              },
            )
          ],
          centerTitle: true,
        ),
        body: Center(child: Text("Plan List")));
  }

  Future<void> _titleShouldntEmpty() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Plan name shouldn\'t be empty,'),
                Text('please input a valid name'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  TextField titleEditable() {
    final controller = TextEditingController();

    var editableTitle = TextField(
      focusNode: _titleFocusNode,
      style: TextStyle(color: Colors.white, fontSize: 30),
      cursorColor: Colors.white,
      textAlign: TextAlign.center,
      controller: controller,
      onSubmitted: (String done) {
        if (done.length == 0) {
          _titleShouldntEmpty();
        } else {
          _planName = done;
          controller.text = _planName;
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Please enter a plan name'),
    );
    controller.text = _planName;

    return editableTitle;
  }

  FloatingActionButton createFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewWorkoutPage(true)))
            .then((v) => {_dealWithReturnValue(v)});
      },
      tooltip: 'Add new workout',
      child: Icon(Icons.add_circle),
    );
  }

  List<Widget> _cellList() {
    return null;
  }

  void _dealWithReturnValue(v) {
    if (v != null) {
      setState(() {});
    }
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

  void dispose() {
    _titleFocusNode.dispose();
    super.dispose();
  }

  Card makeCard(WorkoutDetailModel model) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: Container() //makeListTile(model),
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
