
import 'package:relaxio/core/models/login_response_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}

class LoginSuccesstate extends LoginStates {
  final LoginResponseModel? loginResponseModel;

  LoginSuccesstate({required this.loginResponseModel});
}
