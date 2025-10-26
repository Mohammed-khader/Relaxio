import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:relaxio/core/theme/app_images.dart';
import 'package:relaxio/core/theme/app_padding.dart';
import 'package:relaxio/core/widgets/buttons/custom_buttons.dart';
import 'package:relaxio/features/login/view/login_view.dart';
import 'package:relaxio/features/sign_up/view/sign_up_view.dart';

class OpenScreanView extends StatelessWidget {
  const OpenScreanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppPadding.allpadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset(AppImages.swimming,
                  width: MediaQuery.of(context).size.width / 1, height: 400),
            ),
            const SizedBox(height: 80),
            CustomButtons(
              text: 'Loge in',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
              borderRadius: 10,
            ),
            const SizedBox(height: 20),
            CustomButtons(
              boxborder: Border.all(),
              color: Colors.white,
              text: 'Create account',
              textColor: Colors.black,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpView()));
              },
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
