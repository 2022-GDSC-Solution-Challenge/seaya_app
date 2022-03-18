import 'package:flutter/material.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';
import 'package:seaya_app/utilities/Seawaves.dart';
import 'package:flutter/widgets.dart';


class AnimatedWave extends AnimatedWidget{
  final Color color;
  final double opacity;
  final double bottom;
  /// 0: left
  /// 1: right
  final int direction;

   const AnimatedWave({
     Key? key,
    required Animation<double> animation,
    required this.bottom,
    required this.opacity,
    required this.color,
    required this.direction,
  }): super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

  final animation = listenable as Animation<double>;
  double? left, right;
  if (direction == 1) {
    right = animation.value;
  } else {
    left = animation.value;
  }
    return Positioned(
      bottom: bottom,
      left : left,
      right: right,
      child: ClipPath(
        clipper: MyWaveClipper(),
        child: Opacity(
          opacity: opacity,
          child: Container(
            color: color,
            width: 2000,
            height: 250 *sh,
          ),
        ),
      ),
    );
  }
}
