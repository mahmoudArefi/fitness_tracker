import 'package:flutter/material.dart';

applyShadowFromFourSides(Color shadowColor) {
  return [
    BoxShadow(
      color: shadowColor,
      offset: const Offset(0, -6),
      blurRadius: 4,
    ),
    BoxShadow(
      color: shadowColor,
      offset: const Offset(0, 6),
      blurRadius: 4,
    ),
    BoxShadow(
      color: shadowColor,
      offset: const Offset(-3, 0),
      blurRadius: 4,
    ),
    BoxShadow(
      color: shadowColor,
      offset: const Offset(3, 0),
      blurRadius: 4,
    ),
  ];
}
