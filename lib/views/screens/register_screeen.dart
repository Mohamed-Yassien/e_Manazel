import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.deepOrange,
          child: const Text('login admin '),
          onPressed: () {
            DioHelper.postData(url: 'admin/login/checkCommunityLogin', data: {
              "email": "emadmin@innovativeideasbox.com",
              "password": "123456789",
              "capture" : "1234",
            }).then((value) {
             print(value);
            }).catchError((e) {
              print(e.toString());
            });
          },
        ),
      ),
    );
  }
}
//admin/login/checkCommunityLogin
//admin/mobile