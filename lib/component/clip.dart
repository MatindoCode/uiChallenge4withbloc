import 'dart:ui';

import 'package:flutter/material.dart';

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
     path.moveTo(0, 0);
    path.lineTo(0, size.height / 1.8);
     path.quadraticBezierTo(
      size.width / 2 , 
      size.height , 
      size.width, 
      size.height / 1.8, 
    );
  
      path.lineTo(size.width, 0);
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}