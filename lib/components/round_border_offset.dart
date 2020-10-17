import 'package:flutter/material.dart';

class RoundBorderOffset extends CustomClipper<RRect> {
  RoundBorderOffset({this.borderRadius = 10, this.offset = 4});
  final double borderRadius;
  final double offset;
  @override
  RRect getClip(Size size) {
    return new RRect.fromLTRBXY(0, 0, size.width + this.offset,
        size.height + this.offset, this.borderRadius, this.borderRadius);
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return false;
  }
}
