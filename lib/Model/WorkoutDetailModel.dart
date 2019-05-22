
import 'package:flutter/material.dart';

class WorkoutDetailModel {
  String title;
  String level;
  double indicatorValue;
  int price;
  String content;

  WorkoutDetailModel(
      {@required this.title, @required this.level, @required this.indicatorValue, @required this.price, @required this.content});
}