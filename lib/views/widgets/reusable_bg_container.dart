import 'package:e_manazel/core/generated/assets.dart';
import 'package:e_manazel/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';

class ReusableBackgroundContainer extends StatelessWidget {
  const ReusableBackgroundContainer({
    Key? key,
    required this.info,
    this.child,
  }) : super(key: key);

  final DeviceInfo info;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: info.screenHeight,
      width: info.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesBg,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
