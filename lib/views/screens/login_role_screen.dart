import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/screens/admin_login_screen.dart';
import 'package:e_manazel/views/widgets/resuable_button.dart';
import 'package:e_manazel/views/widgets/reusable_bg_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginRoleScreen extends StatefulWidget {
  const LoginRoleScreen({Key? key}) : super(key: key);

  @override
  State<LoginRoleScreen> createState() => _LoginRoleScreenState();
}

class _LoginRoleScreenState extends State<LoginRoleScreen> {
  List<String> roles = [
    'community admin',
    'community member',
    'service provider',
    'maintenance manager',
    'maintenance staff',
    'security staff',
  ];

  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, info) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(),
          body: ReusableBackgroundContainer(
            info: info,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Please Choose One Role To Login',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 3.h,
                          crossAxisSpacing: 3.h,
                        ),
                        itemCount: roles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? const Color(0xff496A72)
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                roles[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: info.screenWidth,
                      child: ReusableButton(
                        title: 'Continue',
                        onPress: () {
                          navigateTo(
                            widget:   AdminLoginScreen(),
                            context: context,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
