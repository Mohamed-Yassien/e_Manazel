import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:flutter/material.dart';

class ReusableTabBarItem extends StatelessWidget {
  const ReusableTabBarItem({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context,info){
        return Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
              width: info.screenWidth *.12,
              height: info.screenHeight*.05,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            )
          ],
        );
      },
    );
  }
}
