import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/widgets/resuable_drawer_list_tile.dart';
import 'package:e_manazel/views/widgets/reusable_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return InfoWidget(
      builder: (context, info) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableCircleImage(
                          info: info,
                          imagePath: cubit.adminLoginModel!.data!.image!,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          cubit.adminLoginModel!.data!.name!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          '${cubit.adminLoginModel!.data!.countryCode!} ${cubit.adminLoginModel!.data!.mobile!}',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 2.h,
                  ),
                  Card(
                    elevation: 5,
                    child: ReusableDrawerListTile(
                      title: 'email',
                      subtitle: cubit.adminLoginModel!.data!.email,
                      onPress: () {},
                      iconData: Icons.email,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    elevation: 5,
                    child: ReusableDrawerListTile(
                      title: 'community name',
                      subtitle: cubit.adminLoginModel!.data!.communityName,
                      onPress: () {},
                      iconData: Icons.group,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    elevation: 5,
                    child: ReusableDrawerListTile(
                      title: 'community country code',
                      subtitle:
                          cubit.adminLoginModel!.data!.communityCountryCode,
                      onPress: () {},
                      iconData: Icons.call,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    elevation: 5,
                    child: ReusableDrawerListTile(
                      title: 'phone number',
                      subtitle: cubit.adminLoginModel!.data!.mobile,
                      onPress: () {},
                      iconData: Icons.call,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
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
