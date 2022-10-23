import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_cubit.dart';
import 'package:e_manazel/core/network/api_constances.dart';
import 'package:e_manazel/core/responsive/ui_components/info_widget.dart';
import 'package:e_manazel/models/maintenance_by_id_model.dart';
import 'package:e_manazel/views/widgets/resuable_drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MaintenanceDetailsScreen extends StatelessWidget {
  const MaintenanceDetailsScreen({
    Key? key,
    required this.maintenanceByIdModel,
  }) : super(key: key);

  final MaintenanceByIdModel maintenanceByIdModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MaintenanceCubit(),
      child: InfoWidget(
        builder: (context, info) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Align(
                      child: Container(
                        alignment: Alignment.center,
                        width: info.screenWidth * .5,
                        height: info.screenHeight * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xffeaa504),
                            width: 2,
                          ),
                        ),
                        child: (maintenanceByIdModel.data!.image == '' ||
                                maintenanceByIdModel.data!.image == null)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.camera_alt,
                                    size: 35,
                                    color: Color(0xffeaa504),
                                  ),
                                  Text(
                                    'no image here',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: const Color(0xffeaa504),
                                          fontWeight: FontWeight.w500,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  ApiConstance.getImageFullUrl(
                                      maintenanceByIdModel.data!.image!),
                                  fit: BoxFit.cover,
                                  width: info.localWidth,
                                  height: info.localHeight,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      maintenanceByIdModel.data!.service!,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        title: 'requested by',
                        subtitle: maintenanceByIdModel.data!.userName,
                        onPress: () {},
                        iconData: Icons.person,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        title: 'price',
                        subtitle: maintenanceByIdModel.data!.price,
                        onPress: () {},
                        iconData: Icons.price_change_rounded,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        title: 'date of request',
                        subtitle: maintenanceByIdModel.data!.onDate,
                        onPress: () {},
                        iconData: Icons.date_range,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        title: 'time of request',
                        subtitle: maintenanceByIdModel.data!.timeFrom,
                        onPress: () {},
                        iconData: Icons.timelapse,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        inDetails: true,
                        subtitleColor:
                            context.read<MaintenanceCubit>().getStatusColor(
                                  maintenanceByIdModel.data!.staffStatus!,
                                ),
                        title: 'staff status',
                        subtitle:
                            context.read<MaintenanceCubit>().getStatusName(
                                  maintenanceByIdModel.data!.staffStatus!,
                                ),
                        onPress: () {},
                        iconData: Icons.add_circle,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        inDetails: true,
                        subtitleColor:
                            context.read<MaintenanceCubit>().getStatusColor(
                                  maintenanceByIdModel.data!.status!,
                                ),
                        title: 'status',
                        subtitle:
                            context.read<MaintenanceCubit>().getStatusName(
                                  maintenanceByIdModel.data!.status!,
                                ),
                        onPress: () {},
                        iconData: Icons.add_circle,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        inDetails: true,
                        subtitleColor:
                            maintenanceByIdModel.data!.taskStatus == '0'
                                ? Colors.red
                                : Colors.green,
                        title: 'task status',
                        subtitle: maintenanceByIdModel.data!.taskStatus == '0'
                            ? 'Not Done'
                            : 'Done',
                        onPress: () {},
                        iconData: Icons.add_circle,
                      ),
                    ),
                    Card(
                      child: ReusableDrawerListTile(
                        title: 'staff name',
                        subtitle: maintenanceByIdModel.data!.staffName,
                        onPress: () {},
                        iconData: Icons.group_add,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
