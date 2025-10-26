
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/models/farm_details_model.dart';
import 'package:relaxio/features/farm_details/repo/farm_details_repo.dart';
import 'package:relaxio/features/farm_details/view_model/farm_details_states.dart';

class FarmDetailsCubit extends Cubit<FarmDetailsStates> {
  FarmDetailsCubit() : super(FarmDetailsInitialState());

  final _farmDetailsRepo = FarmDetailsRepo();

  FarmDet? farm;

  int? discountPercent = 1;

  Future<void> getFarmDetails(int farmId) async {
    emit(FarmDetailsLoadingState());

    final result = await _farmDetailsRepo.getFarmDetails(farmId);

    result.fold(
      (error) => emit(FarmDetailsErrorState(error: error)),
      (farmResponse) {
        farm = farmResponse.results;
        emit(FarmDetailsSuccessState());
      },
    );
  }
}
