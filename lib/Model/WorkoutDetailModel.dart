
import 'package:flutter/material.dart';

class WorkoutDetailModel {
  String title;
  String level;
  double indicatorValue;
  int stars;
  String content;

  WorkoutDetailModel(
      {@required this.title, @required this.level, @required this.indicatorValue, @required this.stars, @required this.content});
}

final totalWorkouts= <WorkoutDetailModel>[
  WorkoutDetailModel(
    title: "Back workout",
    level: "Normal",
    indicatorValue: 2.2,
    stars: 4,
    content: "The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time. Analytics is not sent on the very first run or for any runs involving flutter config, so you can opt out of analytics before any data is sent. To disable reporting, type flutter config --no-analytics and to display the current setting, type flutter config. See Google’s Privacy Policy."
  ),
  WorkoutDetailModel(
    title: "Arm workout",
    level: "Hard",
    indicatorValue: 2.2,
    stars: 5,
    content: "The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time. Analytics is not sent on the very first run or for any runs involving flutter config, so you can opt out of analytics before any data is sent. To disable reporting, type flutter config --no-analytics and to display the current setting, type flutter config. See Google’s Privacy Policy."
  ),
  WorkoutDetailModel(
    title: "Leg workout",
    level: "Hard ",
    indicatorValue: 2.2,
    stars: 3,
    content: "The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time. Analytics is not sent on the very first run or for any runs involving flutter config, so you can opt out of analytics before any data is sent. To disable reporting, type flutter config --no-analytics and to display the current setting, type flutter config. See Google’s Privacy Policy."
  ),
  WorkoutDetailModel(
    title: "Back workout",
    level: "Normal",
    indicatorValue: 2.2,
    stars: 2,
    content: "The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time. Analytics is not sent on the very first run or for any runs involving flutter config, so you can opt out of analytics before any data is sent. To disable reporting, type flutter config --no-analytics and to display the current setting, type flutter config. See Google’s Privacy Policy."
  ),
  WorkoutDetailModel(
    title: "Shoulder workout",
    level: "Normal",
    indicatorValue: 3.2,
    stars: 5,
    content: "he flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time. Analytics is not sent on the very first run or for any runs involving flutter config, so you can opt out of analytics before any data is sent. To disable reporting, type flutter config --no-analytics and to display the current setting, type flutter config. See Google’s Privacy Policy."
  ),
];
