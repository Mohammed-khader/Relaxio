import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_states.dart';
import 'package:relaxio/generated/l10n.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_cubit.dart';
import 'package:relaxio/features/splash/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cubit = ChangeLangCubit();

  await cubit.loadSavedLanguage();

  runApp(
    BlocProvider<ChangeLangCubit>.value(
      value: cubit,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLangCubit, ChangeLangStates>(
      builder: (context, state) {
        final cubit = context.read<ChangeLangCubit>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: cubit.currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const SplashView(),
        );
      },
    );
  }
}
