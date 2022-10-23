import 'package:e_manazel/core/network/api_constances.dart';
import 'package:e_manazel/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';

class ReusableCircleImage extends StatelessWidget {
  const ReusableCircleImage({
    Key? key,
    required this.info,
    required this.imagePath,
  }) : super(key: key);

  final DeviceInfo info;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        shape: BoxShape.circle,
      ),
      child: Image.network(
        ApiConstance.getImageFullUrl(
         imagePath,
        ),
        width: info.screenWidth * .5,
      ),
    );
  }
}
