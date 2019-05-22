library gymo_workout_model;

enum GymoWorkoutType {
  backWorkout,
  chestWorkout,
  legWorkout,
  customWorkout,
  rest
}

class GymoWorkoutModel {
  GymoWorkoutModel(
    this.uid, [
    this.workoutType = GymoWorkoutType.chestWorkout,
    this.sets = 4,
    this.repeatTime = 12,
    this.workoutInterval = 3.0,
    this.restTime = 30,
    this.workoutCustomName = "CustomName",
  ]);
  GymoWorkoutModel.fromJson(Map<String, dynamic> json)
      : this.workoutType = GymoWorkoutType.values[json["workoutType"].round()],
        this.sets = json["sets"],
        this.repeatTime = json["repeatTime"],
        this.workoutInterval = json["workoutInterval"],
        this.restTime = json["restTime"];

  Map<String, dynamic> toJson() {}

  GymoWorkoutType workoutType = GymoWorkoutType.backWorkout;
  int sets = 4;
  int repeatTime = 12;
  double workoutInterval = 2;
  int restTime = 12;
  String workoutCustomName = "";
  String uid = "";
}
