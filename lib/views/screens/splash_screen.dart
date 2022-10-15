import 'package:e_manazel/core/generated/assets.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, info) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
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
                child: Image.asset(
                  Assets.imagesLogo,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
