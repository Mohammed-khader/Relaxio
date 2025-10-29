import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/extensions/extension.dart';
import 'package:relaxio/core/models/sign_up_response_model.dart';
import 'package:relaxio/features/sign_up/repo/sign_up_repo.dart';
import 'package:relaxio/features/sign_up/view_model/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());
  final formKey = GlobalKey<FormState>();
  final nameControlar = TextEditingController();
  final phoneControlar = TextEditingController();
  final cityIDControlar = TextEditingController();
  final passwordControlar = TextEditingController();
  final confirmpasswordControlar = TextEditingController();
  SignUpResponseModel? signUpResponseModel;
  final _signUpRepo = SignUpRepo();
  Future<void> sendSignUpRequest() async {
    if (formKey.isValid()) {
      emit(SignUpLoadingState());
      final result = await _signUpRepo.sendSignUpRequest(
          name: nameControlar.text,
          phone: phoneControlar.text,
          cityId: cityIDControlar.text,
          password: passwordControlar.text,
          confermPasswoed: confirmpasswordControlar.text);
      result.fold(
        (error) => emit(SignUpErrorState(error: error)),
        (signUpResponseModel) =>
            emit(SignUpSuccessState(signUpResponseModel: signUpResponseModel)),
      );
    }
  }
}
