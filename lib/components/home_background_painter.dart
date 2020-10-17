import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  CurvePainter(
      {this.color, this.heightStart, this.heightEnd, this.widthEnd = 1});
  Color color;
  double heightStart;
  double heightEnd;
  double widthEnd;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * this.heightEnd);
    path.lineTo(size.width * (1 - this.widthEnd), size.height * this.heightEnd);
    path.quadraticBezierTo(
        size.width * 0.5,
        size.height * (this.heightStart - 0.1),
        size.width,
        size.height * this.heightStart);
    path.lineTo(size.width, 0);
    path.close();
    paint.color = this.color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
