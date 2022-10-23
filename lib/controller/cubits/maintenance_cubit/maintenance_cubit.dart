import 'package:e_manazel/controller/cubits/maintenance_cubit/maintenance_states.dart';
import 'package:e_manazel/core/network/endpoints.dart';
import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:e_manazel/models/maintenance_requests_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceCubit extends Cubit<MaintenanceStates> {
  MaintenanceCubit() : super(MaintenanceInitialState());

  static MaintenanceCubit get(context) => BlocProvider.of(context);

  MaintenanceRequestsModel? maintenanceRequestsModel;

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
      emit(GetAllMaintenanceRequestsSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetAllMaintenanceRequestsErrorState());
    });
  }
}
