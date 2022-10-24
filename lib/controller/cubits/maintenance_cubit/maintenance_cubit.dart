import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_states.dart';
import 'package:e_manazel/core/network/endpoints.dart';
import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:e_manazel/models/maintenance_by_id_model.dart';
import 'package:e_manazel/models/maintenance_requests_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceCubit extends Cubit<MaintenanceStates> {
  MaintenanceCubit() : super(MaintenanceInitialState());

  static MaintenanceCubit get(context) => BlocProvider.of(context);

  MaintenanceRequestsModel? maintenanceRequestsModel;
  List<MaintenanceRequestsData>? requestsData;

  void getMaintenanceRequestsData({
    required String userId,
    required String userType,
    required String communityId,
  }) {
    emit(GetAllMaintenanceRequestsLoadingState());
    DioHelper.postData(url: GET_ALL_MAINTENANCE_REQUESTS, data: {
      'user_id': userId,
      'user_type': userType,
      'community_id': communityId,
    }).then((value) {
      print(value.data);
      maintenanceRequestsModel = MaintenanceRequestsModel.fromJson(value.data);
      requestsData = maintenanceRequestsModel!.data!;
      emit(GetAllMaintenanceRequestsSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetAllMaintenanceRequestsErrorState());
    });
  }

  String getStatusName(String statusCode) {
    String statusName = '';
    switch (statusCode) {
      case '0':
        statusName = 'pending';
        break;
      case '1':
        statusName = 'accepted';
        break;
      case '2':
        statusName = 'rejected';
        break;
      default:
        statusName = '';
        break;
    }
    return statusName;
  }

  Color getStatusColor(String statusCode) {
    Color? statusColor;
    switch (statusCode) {
      case '0':
        statusColor = const Color(0xffeaa504);
        break;
      case '1':
        statusColor = Colors.green;
        break;
      case '2':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
        break;
    }
    return statusColor;
  }

  MaintenanceByIdModel? maintenanceByIdModel;

  void getMaintenanceById({
    required String maintenanceId,
    required String userId,
    required String userType,
    required String communityId,
  }) {
    emit(GetMaintenanceByIdLoadingState());
    DioHelper.postData(
      url: GET_MAINTENANCE_BY_ID,
      data: {
        "user_id": userId,
        "user_type": userType,
        "community_id": communityId,
        "maintenance_id": maintenanceId
      },
    ).then(
      (value) {
        if (value.data['success'] == '1') {
          maintenanceByIdModel = MaintenanceByIdModel.fromJson(value.data);
          print(maintenanceByIdModel!.data);
          emit(
            GetMaintenanceByIdSuccessState(
              maintenanceByIdModel: maintenanceByIdModel!,
            ),
          );
        } else {
          emit(GetMaintenanceByIdErrorState(
            message: value.data['message'],
          ));
        }
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(
          GetMaintenanceByIdErrorState(
            message: e.toString(),
          ),
        );
      },
    );
  }

  List<String> statusItems = [
    'pending',
    'accepted',
    'rejected',
    'All',
  ];

  List<MaintenanceRequestsData> filteredRequestsData = [];

  void filterMaintenanceRequestsByStatus(String status) {
    filteredRequestsData = [];
    for (var request in maintenanceRequestsModel!.data!) {
      if(status == '3'){
        filteredRequestsData = maintenanceRequestsModel!.data!;
      }
      if (request.staffStatus == status) {
        if (!filteredRequestsData.contains(request)) {
          filteredRequestsData.add(request);
        }
      }
    }
    requestsData = filteredRequestsData;
    emit(FilterMaintenanceRequestsByStatusState());
  }
}
