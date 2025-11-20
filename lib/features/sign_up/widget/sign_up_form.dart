import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relaxio/core/widgets/buttons/custom_buttons.dart';
import 'package:relaxio/core/widgets/dialog/custom_loding_dialog.dart';
import 'package:relaxio/core/widgets/icons/icons_for_register.dart';
import 'package:relaxio/core/widgets/snakbar/custom_snakbar.dart';
import 'package:relaxio/core/widgets/text_field/custom_text_field.dart';
import 'package:relaxio/features/sign_up/view_model/sign_up_cubit.dart';
import 'package:relaxio/features/sign_up/view_model/sign_up_states.dart';
import 'package:relaxio/features/verify_otp/view/verify_otp_view.dart';
import 'package:relaxio/generated/l10n.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        _signUpHandlerListener(context, state);
      },
      child: Builder(
        builder: (context) {
          final cubit = context.read<SignUpCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).signUp,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: cubit.nameControlar,
                  label: S.of(context).name,
                  keyboardType: TextInputType.name,
                  validator: (username) {
                    if (username?.isEmpty ?? true) {
                      return S.of(context).pleaseEnterYourName;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  label: S.of(context).phone,
                  controller: cubit.phoneControlar,
                  maxLength: 10,
                  validator: (value) {
                    bool isValidPhoneNumber(String phone) {
                      final phoneRegex = RegExp(r'^\d{10}$');
                      return phoneRegex.hasMatch(phone);
                    }

                    if (value == null || value.isEmpty) {
                      return S.of(context).pleaseEnterAPhone;
                    }

                    if (!isValidPhoneNumber(value)) {
                      return S.of(context).PhoneNumberMustBeExactly10Digits;
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  label: 'City ID',
                  controller: cubit.cityIDControlar,
                  validator: (value) {
                    bool isNumeric(String str) {
                      final numericRegex = RegExp(r'^[0-9]+$');
                      return numericRegex.hasMatch(str);
                    }

                    if (value == null || value.isEmpty) {
                      return S.of(context).pleaseEnterACtryIDNumber;
                    }

                    if (!isNumeric(value)) {
                      return S.of(context).onlyDigitsAreAllowed;
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: S.of(context).Password,
                  controller: cubit.passwordControlar,
                  obscureText: true,
                  validator: (password) {
                    if (password?.isEmpty ?? true) {
                      return S.of(context).PleaseEnterYourPassword;
                    } else if ((password?.length ?? 0) < 8) {
                      return S.of(context).passwordMustBeAtLeast8Characters;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: cubit.confirmpasswordControlar,
                  label: S.of(context).confermPassword,
                  obscureText: true,
                  validator: (confermpassword) {
                    if (confermpassword?.isEmpty ?? true) {
                      return S.of(context).pleaseEnterYourConfirmpassword;
                    } else if (confermpassword !=
                        cubit.passwordControlar.text) {
                      return S.of(context).ConfirmPasswordDoesNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomButtons(
                  text: S.of(context).createAccount,
                  onTap: () {
                    cubit.sendSignUpRequest();
                  },
                ),
                const SizedBox(height: 25),
                const IconsForRegister(),
              ],
            ),
          );
        },
      ),
    );
  }

  _signUpHandlerListener(BuildContext context, SignUpStates state) {
    final cubit = context.read<SignUpCubit>();

    if (state is SignUpLoadingState) {
      CustomLoadingDialog.show(context);
    } else if (state is SignUpErrorState) {
      Navigator.pop(context);
      CustomSnackbar.show(context, state.error);
    } else if (state is SignUpSuccessState) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubit,
            child: VerifyOtpView(
              phone: cubit.phoneControlar.text,
              securityToken: state.signUpResponseModel.results.securityToken,
            ),
          ),
        ),
      );
    }
  }
}
