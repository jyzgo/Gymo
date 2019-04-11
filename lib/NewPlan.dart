import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Plan'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[],
          ),
        ));
  }
}
