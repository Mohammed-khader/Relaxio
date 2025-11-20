import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relaxio/core/widgets/buttons/custom_buttons.dart';
import 'package:relaxio/features/sign_up/view_model/sign_up_cubit.dart';
import 'package:relaxio/features/verify_otp/view_model/verify_otp_cubit.dart';
import 'package:relaxio/generated/l10n.dart';

class VerifyOtpFormWidget extends StatelessWidget {
  const VerifyOtpFormWidget({super.key, required this.cubit});
  final VerifyOtpCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).pleaseCheckYourPhoneMessage,
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            '${S.of(context).weveSentACodeTo} ${context.read<SignUpCubit>().phoneControlar.text}',
            style: GoogleFonts.poppins(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: [
                      cubit.otp1,
                      cubit.otp2,
                      cubit.otp3,
                      cubit.otp4,
                    ][i],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty && i < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 50),
          Center(
            child: CustomButtons(
              text: S.of(context).verifyOTP,
              onTap: () {
                cubit.sendVerifyOtp(
                  code: cubit.otpCode,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '${S.of(context).sendCodeAgain}  00:20',
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
