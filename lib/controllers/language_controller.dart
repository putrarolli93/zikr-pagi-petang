import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLanguage {
  indonesia('id', 'Indonesia', '🇮🇩'),
  english('en', 'English', '🇬🇧'),
  russian('ru', 'Russian (Русский)', '🇷🇺');

  final String code;
  final String name;
  final String flag;

  const AppLanguage(this.code, this.name, this.flag);
}

class LanguageController extends ValueNotifier<AppLanguage> {
  static final LanguageController instance = LanguageController._();

  LanguageController._() : super(AppLanguage.indonesia);

  static const String _prefKey = 'app_language_code';
  static const String _firstTimeKey = 'is_first_time_launch';

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_prefKey) ?? 'id';
    value = AppLanguage.values.firstWhere(
      (e) => e.code == code,
      orElse: () => AppLanguage.indonesia,
    );
  }

  Future<void> setLanguage(AppLanguage lang) async {
    value = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, lang.code);
  }

  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  Future<void> setFirstTimeCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, false);
  }
}
