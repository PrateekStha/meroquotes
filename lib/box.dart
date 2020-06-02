  

import 'package:flutter/material.dart';

Color backgroundColor = Colors.grey.shade200;
Color lightColor = Colors.white;
Color shadowColor = Colors.black.withOpacity(0.075);
Color tColor = Colors.grey.shade700;

BoxDecoration nboxD = BoxDecoration(
  shape: BoxShape.rectangle,
  color: backgroundColor,
  
  boxShadow: [
    BoxShadow(
      color: shadowColor,
      offset: Offset(4, 4),
    ),
    BoxShadow(
      color: lightColor,
      offset: Offset(-4, -4),
      blurRadius: 5,
    ),
  ]
);


BoxDecoration nboxDbutton = BoxDecoration(
  shape: BoxShape.circle,
  color: backgroundColor,
  boxShadow: [
    BoxShadow(
      color: shadowColor,
      offset: Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: lightColor,
      offset: Offset(-10, -10),
      blurRadius: 10,
    ),
  ]
);

BoxDecoration nboxDInvert = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: shadowColor,
  boxShadow: [
    BoxShadow(
      color: lightColor,
      offset: Offset(2, 2),
      blurRadius: 3,
      spreadRadius: -2
    ),
  ]
);