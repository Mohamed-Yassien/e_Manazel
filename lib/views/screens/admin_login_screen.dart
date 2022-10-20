import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/controller/cubits/auth_cubit/auth_states.dart';
import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/screens/home_screen.dart';
import 'package:e_manazel/views/widgets/resuable_button.dart';
import 'package:e_manazel/views/widgets/reusable_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login as community admin',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'email',
                              labelStyle: Theme.of(context).textTheme.caption,
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(
                                  color: Color(0xff496A72),
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'email is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: cubit.isPassword,
                            decoration: InputDecoration(
                              labelText: 'password',
                              labelStyle: Theme.of(context).textTheme.caption,
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: Icon(cubit.iconData),
                                color: const Color(0xff496A72),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(
                                  color: Color(0xff496A72),
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'password is required';
                              }
                              return null;
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
                              title: 'Login',
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
            );
          },
        );
      },
    );
  }
}
