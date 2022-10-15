import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginRoleScreen extends StatelessWidget {
  const LoginRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InfoWidget(
        builder: (context, info) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Choose one role of them',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
