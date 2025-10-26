abstract class VerifyOtpStates {}

class VerifyOtpInitialState extends VerifyOtpStates {}

class VerifyOtpLoadingState extends VerifyOtpStates {}

class VerifyOtpSuccessState extends VerifyOtpStates {}

class VerifyOtpErrorState extends VerifyOtpStates {
  final String error;

  VerifyOtpErrorState({required this.error});
}
