import 'package:flutter/material.dart';

class KSJDashedLine extends StatelessWidget {
  // 方向
  final Axis axis;

  // 虚线的宽度
  final double dashedWidth;

  // 虚线的高度
  final double dashedHeight;

  // 虚线的个数决定虚线的密度
  final int count;

  // 虚线的颜色
  final Color color;

  KSJDashedLine(
      {this.axis = Axis.horizontal,
        this.dashedWidth = 2,
        this.dashedHeight = 1,
        this.count = 50,
        this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: axis,
      children: List.generate(count, (index) {
        return SizedBox(
          height: dashedHeight,
          width: dashedWidth,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        );
      }),
    );
  }
}
