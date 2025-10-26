import 'package:relaxio/core/models/sign_up_response_model.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String error;

  SignUpErrorState({required this.error});
}

class SignUpSuccessState extends SignUpStates {
  final SignUpResponseModel signUpResponseModel;

  SignUpSuccessState({required this.signUpResponseModel});
}
