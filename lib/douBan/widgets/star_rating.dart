
import 'package:flutter/material.dart';

class KSJStarsWidget extends StatefulWidget {
  // 当前的分数
  final double rating;

  // 满分是多少
  final double maxRating;

  // 总个数是多少
  final int count;

  // 展示星星的大小
  final double size;

  // 未选中颜色
  final Color unselectedColor;

  // 选中的颜色
  final Color selectedColor;

  // 未选中图片
  final Widget unselectedImage;

  // 选中图片
  final Widget selectedImage;

  KSJStarsWidget(
      {@required this.rating,
        this.maxRating = 10,
        this.count = 5,
        this.size = 30,
        this.unselectedColor = const Color(0xffbbbbbb),
        this.selectedColor = Colors.red,
        Widget unselectedImage,
        Widget selectedImage}) : unselectedImage = unselectedImage ??
      Icon(Icons.star_border, color: unselectedColor, size: size), selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _KSJStarsWidgetState createState() => _KSJStarsWidgetState();
}

class _KSJStarsWidgetState extends State<KSJStarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        ),
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    // 1. 创建stars
    List<Widget> stars = [];

    final star = widget.selectedImage;

    // 2. 构建满填充的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();

    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    // 3. 构建不满的填充star
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    print('$leftWidth');
    final halfStar = ClipRect(child: star, clipper: KSJStarClipper(leftWidth));
    stars.add(halfStar);

    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }

    return stars;
  }
}

// Widget的裁切方法
class KSJStarClipper extends CustomClipper<Rect> {
  // 裁切的范围
  double leftWidth;

  KSJStarClipper(this.leftWidth);

  @override
  Rect getClip(Size size) {
    // 这里方法多类似，小心用错方法会报错
    // ⚠️理解裁剪的具体的范围
    return Rect.fromLTRB(0, 0, leftWidth, size.height);
  }

  @override
  bool shouldReclip(KSJStarClipper oldClipper) {
    return oldClipper.leftWidth != this.leftWidth;
  }
}