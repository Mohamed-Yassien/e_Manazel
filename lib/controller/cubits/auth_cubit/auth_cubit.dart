import 'package:e_manazel/controller/cubits/auth_cubit/auth_states.dart';
import 'package:e_manazel/core/network/endpoints.dart';
import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:e_manazel/models/amdin_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  AdminLoginModel? adminLoginModel;

  bool isPassword = true;

  IconData iconData = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    iconData = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(LoginChangePasswordVisibilityState());
  }

  void loginAdmin({
    required String email,
    required String password,
  }) {
    emit(AdminLoginLoadingState());
    DioHelper.postData(
      url: ADMIN_LOGIN,
      data: {
        "email": email,
        "password": password,
        "user_type": 4,
        "deviceid": "mm",
        "devicetoken": "koko",
        "devicetype": "a"
      },
    ).then((value) {
      adminLoginModel = AdminLoginModel.fromJson(value.data);
      print(value.data);
      emit(
        AdminLoginSuccessState(
          adminLoginModel: adminLoginModel!,
        ),
      );
    }).catchError((e) {
      print(e.toString());
      emit(AdminLoginErrorState());
    });
  }
}
