import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './gymoSet.dart';
import '../utils/FileManager.dart';
import '../Model/GymoWorkoutModel.dart';
import './WorkoutSelection.dart';

class NewWorkoutRoute extends CupertinoPageRoute<NewWorkoutRoute> {
  NewWorkoutRoute() : super(builder: (BuildContext context) => new NewWorkoutPage(true));

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
        position: new Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.0, 0.0),
        ).animate(secondaryAnimation),
        child: NewWorkoutPage(true));
  }
}

class NewWorkoutPage extends StatefulWidget {
  final Widget child;
  final bool isCreate;

  NewWorkoutPage(this.isCreate,{Key key, this.child}) : super(key: key);

  _NewWorkoutPageState createState() => _NewWorkoutPageState(this.isCreate);
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
  FocusNode _titleFocusNode;

  final bool _isCreate;
  String _workoutName;
  int _setsNum;
  int _repeatTime;
  int _restInterval;

  GymoWorkoutModel _gymoWorkoutModel;
  
  @override
  void initState() {
    super.initState();

    _gymoWorkoutModel = GymoWorkoutModel("uid",GymoWorkoutType.backWorkout,3);
  
    _titleFocusNode = FocusNode();
    if(!_isCreate){
      _loadFromFile();
    }else{
      _updateState(); 
    }
  }

  _NewWorkoutPageState(this._isCreate);

  _updateState()
  {
      setState(() {
        _workoutName = _gymoWorkoutModel.workoutType.toString();
        _setsNum = _gymoWorkoutModel.sets;
        _repeatTime = _gymoWorkoutModel.repeatTime;
        _restInterval = _gymoWorkoutModel.restTime;
        
        
      });

  }

  _loadFromFile() {
    FileManager().readCounter().then((int value) {
      _updateState();
      print('value I read is $value');
    });

  }

  TextEditingController _planNameController =
      TextEditingController(text: 'New Plan');
  Scaffold myScald;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: titleEditable(), // Text(_planName ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.edit),onPressed: (){
              print("Edit be pressed");
              FocusScope.of(context).requestFocus(_titleFocusNode);
            },)
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              workoutRaiseButton(),
              _gymTitleText('Sets'),
              GymoSet(_setsNum, _onSetValueChanged),
              _gymTitleText('Works Number'),
              GymoSet(_repeatTime, _onWorksValueChanged),
              _gymTitleText('Rest Interval'),
              GymoSet(_restInterval, _onRestIntervalChanged),
              RaisedButton(
                child: Text('Save',
                    style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
                onPressed: () {
                  Navigator.pop(context, {
                    'title': _planNameController.text,
                    'setsNum': _setsNum,
                    'worksNum': _repeatTime,
                    "restInterval": _restInterval
                  });
                  print('save pressed');
                },
              )
            ],
          ),
        ));
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

  TextField titleEditable()
  {
    final controller = TextEditingController();
    
    var editableTitle = TextField(
      focusNode: _titleFocusNode,
      style: TextStyle(fontSize: 30),
      cursorColor: Colors.black,
      textAlign: TextAlign.center,
      controller:  controller,
      onSubmitted: (String done){
        if(done.length == 0)
        {
          _titleShouldntEmpty();
        }else{
          _workoutName= done;
          controller.text = _workoutName;
        }

      },
      decoration: InputDecoration(
      
      border: InputBorder.none,
      hintText: 'Please enter a plan name'
    ),
      );
     controller.text = _workoutName;

     return editableTitle;
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
    _repeatTime = _repeatTime + v;
  }

  void _onRestIntervalChanged(int v) {
    _restInterval = _restInterval + v;
  }

  void dispose()
  {
    _titleFocusNode .dispose();
    super.dispose();
  }
  RaisedButton _workoutRaiseBtn;
  RaisedButton workoutRaiseButton()
  {
    if(_workoutRaiseBtn == null){
    _workoutRaiseBtn = RaisedButton(color: Colors.lightBlue,onPressed: (){
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>WorkoutSelection()))
              .then((v) => {SelectDown(v)});
    },);
    }
  return _workoutRaiseBtn;
  }
  void SelectDown(dynamic v){
    print("Selcet Back");
  }
}
