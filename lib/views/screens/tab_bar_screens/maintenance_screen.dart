import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_cubit.dart';
import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_states.dart';
import 'package:e_manazel/core/network/api_constances.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return BlocProvider(
      create: (context) => MaintenanceCubit()
        ..getMaintenanceRequestsData(
          userId: cubit.adminLoginModel!.data!.userId!,
          userType: cubit.adminLoginModel!.data!.userType!,
          communityId: cubit.adminLoginModel!.data!.communityId!,
        ),
      child: BlocBuilder<MaintenanceCubit, MaintenanceStates>(
        builder: (context, state) {
          var maintenanceCubit = MaintenanceCubit.get(context);

          return InfoWidget(
            builder: (context, info) {
              return Scaffold(
                body: maintenanceCubit.maintenanceRequestsModel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: maintenanceCubit
                              .maintenanceRequestsModel!.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color(0xffFBFBFB),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: info.localHeight * .1,
                                      width: info.localWidth * .1,
                                      child: maintenanceCubit
                                                  .maintenanceRequestsModel!
                                                  .data![index]
                                                  .image ==
                                              ''
                                          ? Image.asset(
                                              Assets.imagesMaintenance,
                                            )
                                          : Image.network(
                                              ApiConstance.getImageFullUrl(
                                                maintenanceCubit
                                                    .maintenanceRequestsModel!
                                                    .data![index]
                                                    .image!,
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      width: info.screenWidth * .07,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maintenanceCubit
                                                .maintenanceRequestsModel!
                                                .data![index]
                                                .service!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: info.localHeight * .01,
                                          ),
                                          Text(
                                            maintenanceCubit
                                                .maintenanceRequestsModel!
                                                .data![index]
                                                .onDate!,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      maintenanceCubit.maintenanceRequestsModel!
                                          .data![index].status!,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
