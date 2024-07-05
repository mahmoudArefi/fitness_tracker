import 'package:flutter/material.dart';

extension BuildInWidgetExtension on Widget {
  sizedBox({double? h, double? w}) {
    return SizedBox(
      height: h,
      width: w,
      child: this,
    );
  }

  rotatedBox({int? quarterTurns}) {
    return RotatedBox(
      quarterTurns: quarterTurns ?? 2,
      child: this,
    );
  }

  test([Color? color]) {
    return Container(
      color: color ?? Colors.green,
      child: this,
    );
  }

  onTap(Function function){
    return InkWell(
      onTap: function(),
      child: this,
    );
  }
}
