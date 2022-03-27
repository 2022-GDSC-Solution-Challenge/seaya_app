import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/providers/UserProvider.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';
import 'package:flutter/widgets.dart';
import 'package:seaya_app/widgets/aniwidget/AnimatedWave.dart';

class Seawaves extends StatefulWidget {
  const Seawaves({Key? key}) : super(key: key);

  @override
  State<Seawaves> createState() => _SeawavesState();
}

class _SeawavesState extends State<Seawaves>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  late UserProvider _userProvider;
  late Color color1;
  late Color color2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 9), vsync: this);
    _controller.repeat();
    //we set animation duration, and repeat for infinity

    animation = Tween<double>(begin: -1000, end: 0).animate(_controller);
    

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
     //destory anmiation to free memory on last
  }

  @override
  Widget build(BuildContext context) {
     _userProvider = Provider.of<UserProvider>(context, listen: true);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    if(_userProvider.user!.totalp <= 100){
      color1 = Color(0xff9EB5D0);
      color2 = Color(0xffD3E0E5);
    }
    else if(_userProvider.user!.totalp > 100 && _userProvider.user!.totalp <= 200){
      color1 = Color(0xffB9D0E6);
      color2 = Color(0xffD8E9EA);
    }
    else{
      color1 = Color(0xffD8EEFC);
      color2 = Color(0xffE0F8F9);
    }
    return Container(
        //padding: new EdgeInsets.fromLTRB(15*sd, 20 * sh, 15*sd, 20*sh),
        //width: 340 * (width / standardDeviceWidth),
        child: Stack(//stack helps to overlaps widgets
            children: [
         
          AnimatedWave(
            animation: animation,
            bottom: 0,
            opacity: 0.5,
            color: color1,
            direction: 1,
          ),
          AnimatedWave(
            animation: animation,
            bottom: 0,
            opacity: 0.5,
            color: color2,
            direction: 0,
          ),

          
        ]),
      
    );
  }
}

//our custom clipper with Path class
class MyWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    //see my previous post to understand about Bezier Curve waves
    // https://www.hellohpc.com/flutter-how-to-make-bezier-curve-waves-using-custom-clippath/

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


