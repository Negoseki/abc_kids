import 'package:abc_kids/helpers/colors.dart';
import 'package:flutter/material.dart';

class AppDragTarget extends StatelessWidget {
  AppDragTarget({this.width = 60.0, this.height = 60.0});
  final double width;
  final double height;

  final double borderRadius = 15.0;
  final double borderOffset = 2.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: this.borderOffset,
        top: this.borderOffset * 2,
      ),
      child: Container(
        width: this.width - this.borderOffset,
        height: this.height - this.borderOffset,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.borderRadius),
            color: AppColors.YELLOW_BACKGROUND_3,
            boxShadow: [
              BoxShadow(
                spreadRadius: this.borderOffset,
                offset: Offset(-this.borderOffset, -this.borderOffset),
                color: Color.alphaBlend(
                  Colors.black.withOpacity(0.25),
                  AppColors.YELLOW_BACKGROUND_3,
                ),
              ),
            ]),
      ),
    );
  }
}
