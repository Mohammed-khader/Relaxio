abstract class ChangeLangStates {}

class ChangeLangInitialState extends ChangeLangStates {}

class ChangeLangLoadingState extends ChangeLangStates {}

class ChangeLangSuccessState extends ChangeLangStates {}

class ChangeLangErrorState extends ChangeLangStates {
  final String error;

  ChangeLangErrorState({required this.error});
}
