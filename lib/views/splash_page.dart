import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();

    // Navigate to HomePage after 2.5 seconds
    Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Fullscreen Splash Image with Fade In
            FadeTransition(
              opacity: _fadeAnimation,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/splash.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF0F5257),
                      child: const Center(
                        child: Icon(
                          Icons.mosque_rounded,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom Loading Progress Indicator
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(200),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF0F5257),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
