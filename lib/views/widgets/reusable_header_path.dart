import 'package:e_manazel/core/responsive/models/device_info.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:flutter/material.dart';

class ReusableHeaderPath extends StatelessWidget {
  const ReusableHeaderPath({Key? key, required this.info}) : super(key: key);

  final DeviceInfo info;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: info.screenHeight *.3,
        width: double.infinity,
        color: const Color(0xffeaa504),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    Path path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * .5,
      h - 150,
      w,
      h - 50,
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

