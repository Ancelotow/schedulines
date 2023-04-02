import 'package:flutter/material.dart';

class Line {
  final String name;
  final String networkName;
  final String fullName;
  final String idRef;
  final Color color;
  final String mode;
  final String operatorName;
  final String operatorRef;
  final bool isAccessible;
  final String asset;

  Line({
    required this.name,
    required this.mode,
    required this.networkName,
    required this.fullName,
    required this.idRef,
    required this.color,
    required this.operatorName,
    required this.operatorRef,
    required this.isAccessible,
    required this.asset,
  });
}
