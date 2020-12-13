import 'package:abc_kids/components/round_border_offset.dart';
import 'package:flutter/material.dart';

class AppDragButton extends StatelessWidget {
  AppDragButton(
      {@required this.fillColor,
      this.icon,
      this.text = '',
      this.width = 60.0,
      this.height = 60.0});
  final Color fillColor;
  IconData icon;
  String text;
  double width;
  double height;

  final double borderRadius = 15.0;
  final double borderOffset = 5.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        clipper: new RoundBorderOffset(
          borderRadius: this.borderRadius,
          offset: this.borderOffset,
        ),
        child: Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(this.borderRadius),
              ),
              color: fillColor,
              boxShadow: [
                BoxShadow(
                  spreadRadius: this.borderOffset,
                  color: Color.alphaBlend(
                      Colors.white.withOpacity(0.25), fillColor),
                ),
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                this.text,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
