import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxio/core/theme/app_colors.dart';
import 'package:relaxio/core/theme/app_padding.dart';
import 'package:relaxio/features/sign_up/view_model/sign_up_cubit.dart';
import 'package:relaxio/features/sign_up/widget/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: AppColors.primary,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: AppPadding.allpadding,
                child: const SizedBox(
                  height: 700,
                  child: SingleChildScrollView(
                    child: SignUpForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
