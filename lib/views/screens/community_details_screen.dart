import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/controller/cubits/community_details_cubit/community_details_cubit.dart';
import 'package:e_manazel/controller/cubits/community_details_cubit/community_details_states.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/views/widgets/resuable_drawer_list_tile.dart';
import 'package:e_manazel/views/widgets/reusable_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CommunityDetailsScreen extends StatelessWidget {
  const CommunityDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return BlocProvider(
      create: (context) => CommunityDetailsCubit()
        ..getCommunityDetails(
          userId: cubit.adminLoginModel!.data!.userId!,
          userType: cubit.adminLoginModel!.data!.userType!,
          communityId: cubit.adminLoginModel!.data!.communityId!,
        ),
      child: BlocBuilder<CommunityDetailsCubit, CommunityDetailsStates>(
        builder: (context, state) {
          var communityCubit = CommunityDetailsCubit.get(context);

          return InfoWidget(
            builder: (context, info) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Community Details',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                body: state is CommunityDetailsGetDataLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    ReusableCircleImage(
                                      info: info,
                                      imagePath:
                                          '${communityCubit.communityDetailsModel?.data?.images?[0]}',
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      communityCubit
                                          .communityDetailsModel!.data!.name!,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                  title: 'description',
                                  subtitle: communityCubit
                                      .communityDetailsModel!
                                      .data!
                                      .description!,
                                  onPress: () {},
                                  iconData: Icons.description,
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ReusableDrawerListTile(
                                  title: 'contact',
                                  subtitle: communityCubit
                                      .communityDetailsModel!.data!.contact!,
                                  onPress: () {},
                                  iconData: Icons.call,
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ReusableDrawerListTile(
                                  title: 'location',
                                  subtitle: communityCubit
                                      .communityDetailsModel!.data!.location!,
                                  onPress: () {},
                                  iconData: Icons.location_on,
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ReusableDrawerListTile(
                                  title: 'city',
                                  subtitle: communityCubit
                                      .communityDetailsModel!.data!.city!,
                                  onPress: () {},
                                  iconData: Icons.location_city,
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ReusableDrawerListTile(
                                  title: 'area',
                                  subtitle: communityCubit
                                      .communityDetailsModel!.data!.area!,
                                  onPress: () {},
                                  iconData: Icons.area_chart,
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ReusableDrawerListTile(
                                  title: 'country code',
                                  subtitle: communityCubit
                                      .communityDetailsModel!
                                      .data!
                                      .communityCountryCode!,
                                  onPress: () {},
                                  iconData: Icons.call,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
