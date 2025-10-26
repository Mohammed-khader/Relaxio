import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/theme/app_padding.dart';
import 'package:relaxio/core/widgets/dialog/custom_loding_dialog.dart';
import 'package:relaxio/core/widgets/toast_message/toast_message.dart';
import 'package:relaxio/features/home/view/home_view.dart';
import 'package:relaxio/features/verify_otp/view_model/verify_otp_cubit.dart';
import 'package:relaxio/features/verify_otp/view_model/verify_otp_states.dart';
import 'package:relaxio/features/verify_otp/widget/verify_otp_form_widget.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView(
      {super.key, required this.phone, required this.securityToken});

  @override
  VerifyOtpViewState createState() => VerifyOtpViewState();
  final String phone;
  final String securityToken;
}

class VerifyOtpViewState extends State<VerifyOtpView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOtpCubit(
          phone: widget.phone, securityToken: widget.securityToken),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_sharp, size: 30)),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: AppPadding.allpadding,
          child: BlocListener<VerifyOtpCubit, VerifyOtpStates>(
            listener: (context, state) {
              _verifyOtpHandlerListener(state);
            },
            child: Builder(
              builder: (context) {
                return VerifyOtpFormWidget(
                  cubit: context.read<VerifyOtpCubit>(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _verifyOtpHandlerListener(VerifyOtpStates state) {
    if (state is VerifyOtpLoadingState) {
      CustomLoadingDialog.show(context);
    } else if (state is VerifyOtpErrorState) {
      Navigator.pop(context);
      ToastMessage.showErrorMessage(context, state.error);
    } else if (state is VerifyOtpSuccessState) {
      Navigator.pop(context);
      ToastMessage.showSuccessMessage(
          context, 'The signUp process was successful');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    }
  }
}
