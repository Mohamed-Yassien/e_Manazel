import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/views/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => navigateToAndFinish(
        widget: const WelcomeScreen(),
        context: context,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: InfoWidget(
        builder: (context, info) {
          return Center(
            child: Image.asset(
              Assets.imagesLogo,
              width: info.screenWidth,
              height: info.screenHeight * .2,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
