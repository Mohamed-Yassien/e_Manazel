import 'package:e_manazel/models/maintenance_by_id_model.dart';

abstract class MaintenanceStates {}

class MaintenanceInitialState extends MaintenanceStates {}

class GetAllMaintenanceRequestsLoadingState extends MaintenanceStates {}

class GetAllMaintenanceRequestsSuccessState extends MaintenanceStates {}

class GetAllMaintenanceRequestsErrorState extends MaintenanceStates {}

class GetMaintenanceByIdLoadingState extends MaintenanceStates {}

class GetMaintenanceByIdSuccessState extends MaintenanceStates {
  final MaintenanceByIdModel maintenanceByIdModel;

  GetMaintenanceByIdSuccessState({
    required this.maintenanceByIdModel,
  });
}

class GetMaintenanceByIdErrorState extends MaintenanceStates {
  final String message;

  GetMaintenanceByIdErrorState({
    required this.message,
  });
}

class FilterMaintenanceRequestsByStatusState extends MaintenanceStates {}
