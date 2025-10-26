import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relaxio/core/theme/app_colors.dart';
import 'package:relaxio/core/widgets/buttons/custom_buttons.dart';
import 'package:relaxio/core/widgets/dialog/custom_loding_dialog.dart';
import 'package:relaxio/core/widgets/icons/icons_for_register.dart';
import 'package:relaxio/core/widgets/snakbar/custom_snakbar.dart';
import 'package:relaxio/core/widgets/text_field/custom_text_field.dart';
import 'package:relaxio/features/home/view/home_view.dart';
import 'package:relaxio/features/login/view_model/login_cubit.dart';
import 'package:relaxio/features/login/view_model/login_states.dart';
import 'package:relaxio/features/sign_up/view/sign_up_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        _loginHandlerListener(context, state);
      },
      child: Builder(
        builder: (context) {
          final cubit = context.read<LoginCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(fontSize: 40),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: cubit.phoneControler,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email?.isEmpty ?? true) {
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                  label: 'Phone',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: cubit.passwordControler,
                  validator: (password) {
                    if (password?.isEmpty ?? true) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                  label: 'Password',
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Text('Forget Passowrd ?',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: AppColors.primary)),
                ),
                const SizedBox(height: 20),
                CustomButtons(
                  text: 'Login',
                  onTap: () {
                    cubit.sendApiRequest();
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      'Do you have an account ? ',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                      },
                      child: Text(
                        'Sign Up ',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const IconsForRegister(),
              ],
            ),
          );
        },
      ),
    );
  }

  _loginHandlerListener(BuildContext context, LoginStates state) {
    if (state is LoginLoadingState) {
      CustomLoadingDialog.show(context);
    } else if (state is LoginErrorState) {
      Navigator.pop(context);
      CustomSnackbar.show(context, state.error);
    } else if (state is LoginSuccesstate) {
      Navigator.pop(context);
      CustomSnackbar.show(context, state.loginResponseModel.toString(),
          color: Colors.green);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    }
  }
}
