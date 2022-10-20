import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/core/network/local/cache_helper.dart';
import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:e_manazel/core/themes.dart';
import 'package:e_manazel/views/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, type) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            home: const WelcomeScreen(),
          ),
        );
      },
    );
  }
}
