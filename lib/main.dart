import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controllers/language_controller.dart';
import 'services/ad_service.dart';
import 'views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LanguageController.instance.init();
  await AdService.init();


  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dzikir Pagi Petang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F5257),
          primary: const Color(0xFF0F5257),
          secondary: const Color(0xFFD4AF37),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
