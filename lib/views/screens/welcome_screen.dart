import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/views/screens/login_role_screen.dart';
import 'package:e_manazel/views/widgets/resuable_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int groupValue = 0;

  List<String> languages = ['English', 'العربية'];

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, info) {
        return Scaffold(
          appBar: AppBar(),
          extendBodyBehindAppBar: true,
          body: InfoWidget(
            builder: (context, info) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        width: info.screenWidth,
                        height: info.screenHeight * .2,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Choose Language',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        children: List.generate(
                          2,
                          (index) => RadioListTile<int>(
                            activeColor: const Color(0xffeaa504),
                            title: Text(
                              languages[index],
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            value: index,
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                groupValue = val!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                     Row(
                       children: [
                         Expanded(
                           child: ReusableButton(
                             title: 'Login',
                             onPress: () {
                               navigateTo(
                                 widget: const LoginRoleScreen(),
                                 context: context,
                               );
                             },
                           ),
                         ),
                         SizedBox(
                           width: info.screenWidth * .05,
                         ),
                         Expanded(
                           child: ReusableButton(
                             title: 'Sign up',
                             onPress: () {},
                           ),
                         ),
                       ],
                     ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
