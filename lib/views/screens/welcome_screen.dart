import 'package:e_manazel/core/generated/assets.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/widgets/reusable_bg_container.dart';
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
              return ReusableBackgroundContainer(
                info: info,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                      ),
                      Text(
                        'Choose Language',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: const Color(0xff496A72),
                            ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        children: List.generate(
                          2,
                          (index) => RadioListTile<int>(
                            activeColor: const Color(0xff496A72),
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
                      Row(
                        children: [],
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
