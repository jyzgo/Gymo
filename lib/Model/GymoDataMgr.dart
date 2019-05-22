import 'dart:convert';

import 'package:gymo/Model/GymoWorkoutModel.dart';
import 'package:gymo/Model/GymoWorkoutPlanModel.dart';

class GymoDataMgr {
  static final GymoDataMgr _singleton = new GymoDataMgr._internal();

  factory GymoDataMgr() {
    return _singleton;
  }

  List<dynamic> plans;
  List<GymoWorkoutPlanModel> _planModels = List<GymoWorkoutPlanModel>();
  void readJson(String content) {
    plans = jsonDecode(content);
    plans.forEach((p) => {_planModels.add(GymoWorkoutPlanModel.fromJson(p))});
  }

  GymoDataMgr._internal();
}
