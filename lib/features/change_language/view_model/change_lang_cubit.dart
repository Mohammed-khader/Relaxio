import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_states.dart';

class ChangeLangCubit extends Cubit<ChangeLangStates> {
  ChangeLangCubit() : super(ChangeLangInitialState());

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Locale currentLocale = const Locale('en');

  Future<void> changeLanguage(String langCode) async {
    emit(ChangeLangLoadingState());
    try {
      currentLocale = Locale(langCode);
      await _storage.write(key: 'language_code', value: langCode);
      emit(ChangeLangSuccessState());
    } catch (e) {
      emit(ChangeLangErrorState(error: e.toString()));
    }
  }

  Future<void> loadSavedLanguage() async {
    String? code = await _storage.read(key: 'language_code');
    currentLocale = Locale(code ?? 'en');
    emit(ChangeLangSuccessState());
  }
}
