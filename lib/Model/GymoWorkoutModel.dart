library gymo_workout_model;


enum GymoWorkoutType{
  backWorkout,
  chestWorkout,
  legWorkout,
  customWorkout,
  rest
}



class GymoWorkoutModel{
  GymoWorkoutModel([
    this._workoutType ,this.repeatTime,this.workoutInterval,this.restTime]
  );

  GymoWorkoutType _workoutType ;  
  int sets = 4;
  int repeatTime = 12;
  int workoutInterval = 2;
  int restTime = 12;
}