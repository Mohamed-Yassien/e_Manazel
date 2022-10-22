import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          color: Colors.teal,
          onPressed: () {
            // DioHelper.postData(url: 'admin/api/web/getMaintenances', data: {
            //   "user_id":1024,
            //   "user_type":4,
            //   "community_id" : 60
            // }).then((value) {
            //   print(value.data);
            // }).catchError((e){print(e.toString());});
            // DioHelper.postData(url: 'admin/api/web/getMaintenanceById', data: {
            //   "user_id":1024,
            //   "user_type":4,
            //   "community_id" : 60,
            //   "maintenance_id" : 259,
            // }).then((value) {
            //   print(value.data);
            // }).catchError((e){print(e.toString());});

          },
          child: const Text('get'),
        ),
      ),
    );
  }
}
//admin/api/web/getCommunityDetails