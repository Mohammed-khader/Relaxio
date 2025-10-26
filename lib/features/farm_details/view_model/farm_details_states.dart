abstract class FarmDetailsStates {}

class FarmDetailsInitialState extends FarmDetailsStates {}

class FarmDetailsLoadingState extends FarmDetailsStates {}

class FarmDetailsErrorState extends FarmDetailsStates {
  final String error;

  FarmDetailsErrorState({required this.error});
}

class FarmDetailsSuccessState extends FarmDetailsStates {}
