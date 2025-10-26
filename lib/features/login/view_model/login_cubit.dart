import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/features/login/repo/login_repo.dart';
import 'package:relaxio/features/login/view_model/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final _loginRepo = LoginRepo();
  final phoneControler = TextEditingController();
  final passwordControler = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> sendApiRequest() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoadingState());
      final result = await _loginRepo.sendApiRequest(
          phone: phoneControler.text, password: passwordControler.text);
      result.fold(
        (error) {
          emit(LoginErrorState(error: error));
        },
        (farmsModel) {
          log("Token ${farmsModel?.results?.accesstoken ?? ''}");
          emit(LoginSuccesstate(loginResponseModel: farmsModel));
        },
      );
    }
  }
}
