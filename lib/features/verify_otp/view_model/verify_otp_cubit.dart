import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/features/verify_otp/repo/verify_otp_repo.dart';
import 'package:relaxio/features/verify_otp/view_model/verify_otp_states.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpStates> {
  VerifyOtpCubit({required this.phone, required this.securityToken})
      : super(VerifyOtpInitialState());
  final formKey = GlobalKey<FormState>();
  final String phone;
  final String securityToken;
  final _verifyOtpRepo = VerifyOtpRepo();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();

  String get otpCode => otp1.text + otp2.text + otp3.text + otp4.text;

  Future<void> sendVerifyOtp({required String code}) async {
    final result = await _verifyOtpRepo.sendVerifyOtp(
      phone: phone,
      otp: otpCode,
      securityToken: securityToken,
    );
    result.fold(
      (error) => emit(VerifyOtpErrorState(error: error)),
      (success) => emit(VerifyOtpSuccessState()),
    );
  }
}
