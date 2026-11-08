import 'package:flutter/material.dart';
import '../controllers/language_controller.dart';
import '../utils/translations.dart';
import '../widgets/banner_ad_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.instance,
      builder: (context, lang, _) {
        return Scaffold(
          bottomNavigationBar: const SafeArea(
            child: BannerAdWidget(),
          ),
          appBar: AppBar(

            title: Text(AppTranslations.get('about_app', lang)),
            backgroundColor: const Color(0xFF0F5257),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F5257),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 36,
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(50),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/app_icon.png',
                            fit: BoxFit.cover,

                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.info_outline,
                                  size: 60,
                                  color: Colors.amber,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppTranslations.get('app_title', lang),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppTranslations.get('app_version', lang),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFD4AF37),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppTranslations.get('description_title', lang),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F5257),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppTranslations.get('app_description', lang),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppTranslations.get('key_features', lang),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F5257),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureTile(
                        Icons.wb_sunny_rounded,
                        AppTranslations.get('dzikir_pagi', lang),
                        AppTranslations.get('dzikir_pagi_sub', lang),
                      ),
                      _buildFeatureTile(
                        Icons.nights_stay_rounded,
                        AppTranslations.get('dzikir_petang', lang),
                        AppTranslations.get('dzikir_petang_sub', lang),
                      ),
                      _buildFeatureTile(
                        Icons.access_time_filled_rounded,
                        AppTranslations.get('dzikir_sholat', lang),
                        AppTranslations.get('dzikir_sholat_sub', lang),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: Text(
                          '© 2026 Zikr Pagi Petang By AppMuslim',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
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
      },
    );
  }

  Widget _buildFeatureTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF0F5257).withAlpha(20),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF0F5257)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
