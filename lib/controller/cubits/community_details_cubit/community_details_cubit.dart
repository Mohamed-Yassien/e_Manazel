import 'package:e_manazel/controller/cubits/community_details_cubit/community_details_states.dart';
import 'package:e_manazel/core/network/endpoints.dart';
import 'package:e_manazel/core/network/remote/dio_helper.dart';
import 'package:e_manazel/models/community_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityDetailsCubit extends Cubit<CommunityDetailsStates> {
  CommunityDetailsCubit() : super(CommunityDetailsInitialState());

  static CommunityDetailsCubit get(context) => BlocProvider.of(context);

  CommunityDetailsModel? communityDetailsModel;

  void getCommunityDetails({
    required String userId,
    required String userType,
    required String communityId,
  }) {
    emit(CommunityDetailsGetDataLoadingState());
    DioHelper.postData(url: GET_COMMUNITY_DETAILS, data: {
      "user_id": userId,
      "user_type": userType,
      "community_id": communityId
    }).then((value) {
      print(value.data);
      communityDetailsModel = CommunityDetailsModel.fromJson(value.data);
      emit(CommunityDetailsGetDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(CommunityDetailsGetDataErrorState());
    });
  }
}
