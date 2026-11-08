import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/language_controller.dart';
import '../utils/translations.dart';
import '../widgets/banner_ad_widget.dart';
import 'about_page.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> _contactUs(BuildContext context, AppLanguage lang) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'developers@appmuslim.com',
      queryParameters: {
        'subject': 'Dzikir Pagi Petang App Feedback',
      },
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        if (context.mounted) {
          await _copyEmail(context, lang);
        }
      }
    } catch (_) {
      if (context.mounted) {
        await _copyEmail(context, lang);
      }
    }

  }

  Future<void> _copyEmail(BuildContext context, AppLanguage lang) async {
    await Clipboard.setData(
      const ClipboardData(text: 'developers@appmuslim.com'),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppTranslations.get('email_copied', lang)),
          backgroundColor: const Color(0xFF0F5257),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0D9488);

    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.instance,
      builder: (context, currentLang, _) {
        return Scaffold(
          bottomNavigationBar: const SafeArea(
            child: BannerAdWidget(),
          ),
          appBar: AppBar(

            title: Text(AppTranslations.get('settings', currentLang)),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Header Banner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D9488), Color(0xFF0F5257)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withAlpha(50),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/settings.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.settings_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTranslations.get('settings', currentLang),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppTranslations.get('select_language', currentLang),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFFD4AF37),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Section: Language Selection
              Text(
                AppTranslations.get('select_language', currentLang),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 12),

              // 3 Language Options with Flags
              ...AppLanguage.values.map(
                (lang) => _buildLanguageTile(
                  context: context,
                  lang: lang,
                  isSelected: lang == currentLang,
                  onSelect: () {
                    LanguageController.instance.setLanguage(lang);
                  },
                ),
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              // Warm Correction & Feedback Info Card
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFCD34D), width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.mark_email_unread_rounded,
                      color: Color(0xFFD97706),
                      size: 26,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTranslations.get('correction_notice_title', currentLang),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF92400E),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            AppTranslations.get('correction_notice_desc', currentLang),
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: Color(0xFF78350F),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Section: Contact Us (Hubungi Kami)
              _buildSettingTile(
                icon: Icons.mail_outline_rounded,
                iconColor: const Color(0xFFD97706),
                title: AppTranslations.get('contact_us', currentLang),
                subtitle: AppTranslations.get('contact_us_sub', currentLang),
                onTap: () => _contactUs(context, currentLang),
              ),

              const SizedBox(height: 12),

              // Section: About App (Tentang Aplikasi)
              _buildSettingTile(
                icon: Icons.info_outline_rounded,
                iconColor: const Color(0xFF0F5257),
                title: AppTranslations.get('about_app', currentLang),
                subtitle: AppTranslations.get('app_version', currentLang),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageTile({
    required BuildContext context,
    required AppLanguage lang,
    required bool isSelected,
    required VoidCallback onSelect,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isSelected ? const Color(0xFF0D9488) : Colors.grey.shade200,
          width: isSelected ? 2 : 1,
        ),
      ),
      elevation: isSelected ? 3 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onSelect,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Text(
                lang.flag,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  lang.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? const Color(0xFF0D9488)
                        : const Color(0xFF1E293B),
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF0D9488),
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
