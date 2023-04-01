import 'package:flutter/cupertino.dart';

class StopSelectedNotification<Stop> extends Notification {
  final Stop stop;

  StopSelectedNotification(this.stop);
}