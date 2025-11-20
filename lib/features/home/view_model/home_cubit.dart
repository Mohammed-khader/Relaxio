import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/models/farm_model.dart';
import 'package:relaxio/features/home/repo/home_repo.dart';
import 'package:relaxio/features/home/view_model/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final _homeRepo = HomeRepo();
  final searchController = TextEditingController();

  int discountPercent = 1;

  List<Farm?> farms = [];
  List<Farm?> farmsSearch = [];

  Future<void> getAllFarms() async {
    emit(HomeLoadingState());
    final result = await _homeRepo.getAllFarms();

    result.fold(
      (error) => emit(HomeErrorState(error: error)),
      (farmsResponse) {
        farms =
            (farmsResponse.results?.data ?? []).map((e) => e as Farm?).toList();
        emit(HomeSuccessState());
      },
    );
  }

  void getSearchFarm(String name) {
    farmsSearch.clear();
    for (var element in farms) {
      if (element!.nameEn!.toLowerCase().contains(name.toLowerCase())) {
        farmsSearch.add(element);
      }
    }
    emit(HomeSearchState());
  }
}
