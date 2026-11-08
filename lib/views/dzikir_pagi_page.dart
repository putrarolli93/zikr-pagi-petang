import 'package:flutter/material.dart';
import '../controllers/language_controller.dart';
import '../data/dzikir_pagi_data.dart';
import '../utils/translations.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/dzikir_card_widget.dart';

class DzikirPagiPage extends StatelessWidget {
  const DzikirPagiPage({super.key});

  void _showRumayshoInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.verified_rounded, color: Color(0xFF0F5257)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Rujukan Dzikir Pagi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF0F5257).withAlpha(15),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: const Color(0xFF0F5257).withAlpha(40)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🌐 Dikutip dari Rumaysho.com',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F5257),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Bacaan dzikir bersumber dari Al-Qur\'an dan As-Sunnah yang shahih.',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0F5257);

    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.instance,
      builder: (context, lang, _) {
        return Scaffold(
          bottomNavigationBar: const SafeArea(
            child: BannerAdWidget(),
          ),
          appBar: AppBar(
            title: Text(AppTranslations.get('dzikir_pagi', lang)),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline_rounded),
                tooltip: 'Rujukan Rumaysho.com',
                onPressed: () => _showRumayshoInfoDialog(context),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header Banner
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F5257), Color(0xFF064E3B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTranslations.get('dzikir_pagi', lang),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            AppTranslations.get('dzikir_pagi_sub', lang),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFFD4AF37),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(30),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${dzikirPagiData.length} ${AppTranslations.get('recitations_count', lang)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/dzikir_pagi.png',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.wb_sunny_rounded,
                          size: 55,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // List of Dzikir Cards
              ...dzikirPagiData.map(
                (item) => DzikirCardWidget(
                  item: item,
                  primaryColor: primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
