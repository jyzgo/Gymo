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

class _NewPlanPageState extends State<NewPlanPage>
    implements ObserverListenerInterface {
  _NewPlanPageState() {
    ObserverCenter.addMutipleListeners([
      GymoNotificationEnum.SetNumberChanged.index,
      GymoNotificationEnum.WorkIntervalChanged.index,
      GymoNotificationEnum.RestIntervalChanged.index
    ], this);
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: AppBar(
          title: Text('New Plan'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[GymoSet()],
          ),
        ));
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
