import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/controller/cubits/auth_cubit/auth_states.dart';
import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/screens/home_screen.dart';
import 'package:e_manazel/views/widgets/resuable_button.dart';
import 'package:e_manazel/views/widgets/reusable_header_path.dart';
import 'package:e_manazel/views/widgets/reusable_text_field.dart';
import 'package:e_manazel/views/widgets/reusable_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AdminLoginSuccessState) {
          if (state.adminLoginModel.success! == '0') {
            showToast(
              msg: state.adminLoginModel.message!,
              toastStates: ToastStates.ERROR,
            );
            return;
          }
          showToast(
            msg: state.adminLoginModel.message!,
            toastStates: ToastStates.SUCCESS,
          );
          navigateToAndFinish(
            widget: const HomeScreen(),
            context: context,
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);

        return InfoWidget(
          builder: (context, info) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableHeaderPath(
                      info: info,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.login,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                ReusableTextField(
                                  textInputType: TextInputType.emailAddress,
                                  controller: emailController,
                                  label: AppLocalizations.of(context)!.email,
                                  validate: (val) {
                                    if (val.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .email_req;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                ReusableTextField(
                                  secureText: cubit.isPassword,
                                  textInputType: TextInputType.text,
                                  controller: passwordController,
                                  label: AppLocalizations.of(context)!.password,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.iconData,
                                    ),
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    color: const Color(0xffeaa504),
                                  ),
                                  hasPassword: true,
                                  validate: (val) {
                                    if (val.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .password_req;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            width: info.screenWidth,
                            child: cubit.state is AdminLoginLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ReusableButton(
                                    title: AppLocalizations.of(context)!.login,
                                    onPress: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.loginAdmin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
