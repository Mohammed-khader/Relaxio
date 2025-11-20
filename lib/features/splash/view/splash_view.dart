import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:relaxio/core/local/local_storage_service.dart';
import 'package:relaxio/core/local/user_data.dart';
import 'package:relaxio/core/theme/app_colors.dart';
import 'package:relaxio/core/theme/app_images.dart';
import 'package:relaxio/features/home/view/home_view.dart';
import 'package:relaxio/features/openning_screan/view/open_screan_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _goToLogin();
  }

  _goToLogin() {
    Future.delayed(const Duration(seconds: 2)).then(
      (_) async {
        final isLogin = await LocalStorageService.instance.getUserIsLogin();
        if (isLogin) {
          final userData = await LocalStorageService.instance.getUserData();
          if (userData != null) {
            UserDataService.setUserData(userData);
            if (context.mounted) {
              Navigator.pushReplacement(
                (context),
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            }
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OpenScreanView(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              AppImages.swimming,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
          Text(
            'Relaxio',
            style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.bold, fontSize: 70),
          )
        ],
      ),
    );
  }
}
