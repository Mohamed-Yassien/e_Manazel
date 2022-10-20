import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            DioHelper.postData(url: 'mobile/user/changepassword', data: {
              "btn_change": true,
              "code": 2,
              "password": "123456789",
            }).then((value) {
              print(value);
            }).catchError((e) {
              print(e.toString());
            });
          },
          color: Colors.deepOrange,
          child: const Text('change password'),
        ),
      ),
    );
  }
}
