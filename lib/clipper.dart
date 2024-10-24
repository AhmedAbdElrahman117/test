import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {}

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
