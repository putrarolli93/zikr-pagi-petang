import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/language_controller.dart';
import '../services/ad_service.dart';
import '../utils/translations.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/rotating_quote_widget.dart';
import 'dzikir_pagi_page.dart';
import 'dzikir_petang_page.dart';
import 'dzikir_sholat_page.dart';
import 'settings_page.dart';


class TimeThemeData {
  final LinearGradient bannerGradient;
  final Color scaffoldBgColor;
  final String greetingKey;
  final IconData timeIcon;
  final Color accentTextColor;

  const TimeThemeData({
    required this.bannerGradient,
    required this.scaffoldBgColor,
    required this.greetingKey,
    required this.timeIcon,
    required this.accentTextColor,
  });

  static TimeThemeData current() {
    final hour = DateTime.now().hour;

    // Pagi (04:00 - 10:59): Soft Emerald & Dawn Mint
    if (hour >= 4 && hour < 11) {
      return const TimeThemeData(
        bannerGradient: LinearGradient(
          colors: [Color(0xFF0F5257), Color(0xFF0D9488), Color(0xFF059669)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        scaffoldBgColor: Color(0xFFF0FDF4),
        greetingKey: 'time_morning',
        timeIcon: Icons.wb_sunny_rounded,
        accentTextColor: Color(0xFFFDE047),
      );
    }
    // Siang (11:00 - 14:59): Soft Sky Blue & Solar Teal
    else if (hour >= 11 && hour < 15) {
      return const TimeThemeData(
        bannerGradient: LinearGradient(
          colors: [Color(0xFF0369A1), Color(0xFF0284C7), Color(0xFF0D9488)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        scaffoldBgColor: Color(0xFFF0F9FF),
        greetingKey: 'time_afternoon',
        timeIcon: Icons.light_mode_rounded,
        accentTextColor: Color(0xFFFEF08A),
      );
    }
    // Sore / Petang (15:00 - 18:29): Soft Warm Sunset Purple & Amber
    else if (hour >= 15 && hour < 18.5) {
      return const TimeThemeData(
        bannerGradient: LinearGradient(
          colors: [Color(0xFF6B21A8), Color(0xFF9333EA), Color(0xFFC084FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        scaffoldBgColor: Color(0xFFFAF5FF),
        greetingKey: 'time_evening',
        timeIcon: Icons.wb_twilight_rounded,
        accentTextColor: Color(0xFFFED7AA),
      );
    }
    // Malam (18:30 - 03:59): Soft Midnight Navy & Starlight Indigo
    else {
      return const TimeThemeData(
        bannerGradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E1B4B), Color(0xFF312E81)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        scaffoldBgColor: Color(0xFFF1F5F9),
        greetingKey: 'time_night',
        timeIcon: Icons.nights_stay_rounded,
        accentTextColor: Color(0xFF93C5FD),
      );
    }
  }
}

class MenuItemModel {
  final String titleKey;
  final String imagePath;
  final Widget page;
  final Color themeColor;
  final IconData fallbackIcon;

  const MenuItemModel({
    required this.titleKey,
    required this.imagePath,
    required this.page,
    required this.themeColor,
    required this.fallbackIcon,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkFirstTimeLaunch();
    });
  }

  Future<void> _checkFirstTimeLaunch() async {
    final isFirstTime = await LanguageController.instance.isFirstTime();
    if (isFirstTime && mounted) {
      _showFirstTimeLanguageDialog();
    }
  }

  void _showFirstTimeLanguageDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ValueListenableBuilder<AppLanguage>(
          valueListenable: LanguageController.instance,
          builder: (context, selectedLang, _) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              contentPadding: const EdgeInsets.all(24),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F5257).withAlpha(20),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.translate_rounded,
                      color: Color(0xFF0F5257),
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppTranslations.get('welcome_first_time', selectedLang),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppTranslations.get('select_language', selectedLang),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0F5257),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Flag Radio Selection
                  ...AppLanguage.values.map(
                    (lang) => InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        LanguageController.instance.setLanguage(lang);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: lang == selectedLang
                              ? const Color(0xFF0F5257).withAlpha(15)
                              : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: lang == selectedLang
                                ? const Color(0xFF0F5257)
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(lang.flag,
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                lang.name,
                                style: TextStyle(
                                  fontWeight: lang == selectedLang
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ),
                            if (lang == selectedLang)
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFF0F5257),
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Notice Text
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber.shade200),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline_rounded,
                            size: 18, color: Colors.amber.shade900),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppTranslations.get(
                                'language_notice', selectedLang),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.amber.shade900,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F5257),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () async {
                        await LanguageController.instance
                            .setFirstTimeCompleted();
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        AppTranslations.get(
                            'continue_button', selectedLang),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeTheme = TimeThemeData.current();

    final List<MenuItemModel> menuItems = [
      const MenuItemModel(
        titleKey: 'dzikir_pagi',
        imagePath: 'assets/images/dzikir_pagi.png',
        page: DzikirPagiPage(),
        themeColor: Color(0xFF0F5257),
        fallbackIcon: Icons.wb_sunny_rounded,
      ),
      const MenuItemModel(
        titleKey: 'dzikir_petang',
        imagePath: 'assets/images/dzikir_petang.png',
        page: DzikirPetangPage(),
        themeColor: Color(0xFF1E293B),
        fallbackIcon: Icons.nights_stay_rounded,
      ),
      const MenuItemModel(
        titleKey: 'dzikir_sholat',
        imagePath: 'assets/images/dzikir_sholat.png',
        page: DzikirSholatPage(),
        themeColor: Color(0xFF047857),
        fallbackIcon: Icons.access_time_filled_rounded,
      ),
      const MenuItemModel(
        titleKey: 'settings',
        imagePath: 'assets/images/settings.png',
        page: SettingsPage(),
        themeColor: Color(0xFF0D9488),
        fallbackIcon: Icons.settings_rounded,
      ),
    ];

    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.instance,
      builder: (context, currentLang, _) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: timeTheme.scaffoldBgColor,
            bottomNavigationBar: const SafeArea(
              child: BannerAdWidget(),
            ),
            body: SafeArea(


            child: CustomScrollView(
              slivers: [
                // Top Header Banner with Time-Aware Dynamic Soft Gradient
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: timeTheme.bannerGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(40),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(40),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          timeTheme.timeIcon,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          AppTranslations.get(
                                              timeTheme.greetingKey, currentLang),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                AppTranslations.get('app_title', currentLang),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                AppTranslations.get(
                                    'sub_greeting', currentLang),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: timeTheme.accentTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Section Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Text(
                      AppTranslations.get('main_menu', currentLang),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ),
                ),

                // 4 Grid Menu Cards (Kotak)
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = menuItems[index];
                        return _buildMenuCard(context, item, currentLang);
                      },
                      childCount: menuItems.length,
                    ),
                  ),
                ),

                // Bottom Rotating Quote Card
                SliverToBoxAdapter(
                  child: RotatingQuoteWidget(
                    currentLang: currentLang,
                    backgroundGradient: timeTheme.bannerGradient,
                    timeIcon: timeTheme.timeIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}



  Widget _buildMenuCard(
      BuildContext context, MenuItemModel item, AppLanguage lang) {
    final title = AppTranslations.get(item.titleKey, lang);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 3,
      shadowColor: Colors.black.withAlpha(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          AdService.showInterstitialAd(
            onComplete: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item.page),
              );
            },
          );
        },

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.shade100,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Container (Kotak Gambar)
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: item.themeColor.withAlpha(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            item.fallbackIcon,
                            size: 48,
                            color: item.themeColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Title Text Below Image (Judul di bawah Gambar)
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
