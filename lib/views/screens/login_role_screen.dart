import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/views/screens/admin_login_screen.dart';
import 'package:e_manazel/views/widgets/resuable_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginRoleScreen extends StatefulWidget {
  const LoginRoleScreen({Key? key}) : super(key: key);

  @override
  State<LoginRoleScreen> createState() => _LoginRoleScreenState();
}

class _LoginRoleScreenState extends State<LoginRoleScreen> {
  List<String> roles(context) => [
        AppLocalizations.of(context)!.com_admin,
        AppLocalizations.of(context)!.com_member,
        AppLocalizations.of(context)!.service_provider,
        AppLocalizations.of(context)!.maintenance_manager,
        AppLocalizations.of(context)!.maintenance_staff,
        AppLocalizations.of(context)!.security_staff,
      ];

  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, info) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.choose_role,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.h,
                        crossAxisSpacing: 4.h,
                      ),
                      itemCount: roles(context).length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: InfoWidget(
                            builder: (context, localInfo) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: currentIndex == index
                                        ? const Color(0xffeaa504)
                                        : Colors.grey.shade300,
                                    width: currentIndex == index ? 2 : 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.imagesMan,
                                      width: localInfo.localWidth * .4,
                                      height: localInfo.localHeight * .4,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      roles(context)[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: info.screenWidth,
                    child: ReusableButton(
                      title: AppLocalizations.of(context)!.cont,
                      onPress: () {
                        switch (currentIndex) {
                          case 0:
                            navigateTo(
                              widget: AdminLoginScreen(),
                              context: context,
                            );
                            break;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
