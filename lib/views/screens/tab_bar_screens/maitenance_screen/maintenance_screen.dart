import 'package:e_manazel/controller/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_cubit.dart';
import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_states.dart';
import 'package:e_manazel/core/methods.dart';
import 'package:e_manazel/core/network/api_constances.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/generated/assets.dart';
import 'package:e_manazel/views/screens/tab_bar_screens/maitenance_screen/maintenance_details_screen.dart';
import 'package:e_manazel/views/widgets/reusable_toast.dart';
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
      child: BlocConsumer<MaintenanceCubit, MaintenanceStates>(
        listener: (context, state) {
          if (state is GetMaintenanceByIdSuccessState) {
            if (state.maintenanceByIdModel.data != null) {
              navigateTo(
                widget: MaintenanceDetailsScreen(
                  maintenanceByIdModel: state.maintenanceByIdModel,
                ),
                context: context,
              );
            }
          } else if (state is GetMaintenanceByIdErrorState) {
            showToast(
              msg: state.message,
              toastStates: ToastStates.WARNING,
            );
          }
        },
        builder: (context, state) {
          var maintenanceCubit = MaintenanceCubit.get(context);

          return InfoWidget(
            builder: (context, info) {
              return Scaffold(
                body: maintenanceCubit.requestsData == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 25,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text(
                                        'select status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      iconSize: 30,
                                      iconEnabledColor: const Color(0xffeaa504),
                                      iconDisabledColor:
                                          const Color(0xffeaa504),
                                      items: List.generate(
                                        maintenanceCubit.statusItems.length,
                                        (index) {
                                          return DropdownMenuItem<String>(
                                            value: maintenanceCubit
                                                .statusItems[index],
                                            child: Text(
                                              maintenanceCubit
                                                  .statusItems[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    color: maintenanceCubit
                                                        .getStatusColor(
                                                      '$index',
                                                    ),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                            ),
                                            onTap: () {
                                              print(index);
                                              maintenanceCubit
                                                  .filterMaintenanceRequestsByStatus(
                                                '$index',
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      onChanged: (val) {},
                                      isExpanded: true,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: maintenanceCubit.requestsData!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      maintenanceCubit.getMaintenanceById(
                                        maintenanceId: maintenanceCubit
                                            .requestsData![index].requestId!,
                                        userId: cubit
                                            .adminLoginModel!.data!.userId!,
                                        userType: cubit
                                            .adminLoginModel!.data!.userType!,
                                        communityId: cubit.adminLoginModel!
                                            .data!.communityId!,
                                      );
                                    },
                                    child: Card(
                                      elevation: 3,
                                      color: const Color(0xffFBFBFB),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: info.localHeight * .1,
                                              width: info.localWidth * .1,
                                              child: (maintenanceCubit
                                                              .requestsData![
                                                                  index]
                                                              .image ==
                                                          '' ||
                                                      maintenanceCubit
                                                              .requestsData![
                                                                  index]
                                                              .image ==
                                                          null)
                                                  ? Image.asset(
                                                      Assets.imagesMaintenance,
                                                    )
                                                  : Image.network(
                                                      ApiConstance
                                                          .getImageFullUrl(
                                                        maintenanceCubit
                                                            .requestsData![index]
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
                                                        .requestsData![index]
                                                        .service!,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        info.localHeight * .01,
                                                  ),
                                                  Text(
                                                    maintenanceCubit
                                                        .requestsData![index]
                                                        .onDate!,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              maintenanceCubit.getStatusName(
                                                maintenanceCubit
                                                    .requestsData![index]
                                                    .staffStatus!,
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: maintenanceCubit
                                                        .getStatusColor(
                                                      maintenanceCubit
                                                          .requestsData![index]
                                                          .staffStatus!,
                                                    ),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
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
      ),
    );
  }
}
