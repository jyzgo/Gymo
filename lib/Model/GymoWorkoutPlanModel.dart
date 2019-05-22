//plans
/*
  GymoWorkoutPlanModel
    -each plan have many workout
    GymoWorkoutModel[]
      -workout model define each workout set
      -workout Type model is static , define the basic of this worktype
      WorkoutDetailModel
*/

import 'package:gymo/Model/GymoWorkoutModel.dart';

class GymoWorkoutPlanModel {
  String planName = "";
  String uid = "";
  int totalSets = 0;
  double totalTime = 0;
  List<GymoWorkoutModel> workouts = List<GymoWorkoutModel>();

  GymoWorkoutPlanModel.fromJson(Map<String, dynamic> json) {
    planName = json["planName"];
    uid = json["uid"];
    json["workouts"].forEach(
        (workout) => {workouts.add(GymoWorkoutModel.fromJson(workout))});
  }
}
