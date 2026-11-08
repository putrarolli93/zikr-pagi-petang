import 'dart:async';
import 'package:flutter/material.dart';
import '../controllers/language_controller.dart';
import '../utils/translations.dart';

class QuoteItem {
  final String id;
  final String en;
  final String ru;

  const QuoteItem({
    required this.id,
    required this.en,
    required this.ru,
  });

  String getQuote(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.english:
        return en;
      case AppLanguage.russian:
        return ru;
      case AppLanguage.indonesia:
        return id;
    }
  }
}

const List<QuoteItem> quotesList = [
  QuoteItem(
    id: '"Ingatlah Aku, niscaya Aku ingat (pula) kepadamu." (QS. Al-Baqarah: 152)',
    en: '"So remember Me; I will remember you." (Quran 2:152)',
    ru: '"Поминайте Меня, и Я буду помнить о вас." (Коран 2:152)',
  ),
  QuoteItem(
    id: '"Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram." (QS. Ar-Ra\'d: 28)',
    en: '"Unquestionably, by the remembrance of Allah hearts find rest." (Quran 13:28)',
    ru: '"Разве не поминанием Аллаха утешаются сердца?" (Коран 13:28)',
  ),
  QuoteItem(
    id: '"Perumpamaan orang yang berdzikir kepada Rabbnya dan yang tidak, seperti orang hidup dan orang mati." (HR. Bukhari no. 6407)',
    en: '"The example of the one who remembers his Lord and the one who does not is like the living and the dead." (HR. Bukhari)',
    ru: '"Пример того, кто поминает своего Господа, и того, кто не поминает, подобен живому и мертвому." (Аль-Бухари)',
  ),
  QuoteItem(
    id: '"Wahai orang-orang yang beriman! Berdzikirlah (dengan menyebut nama) Allah, dzikir yang sebanyak-banyaknya." (QS. Al-Ahzab: 41)',
    en: '"O you who have believed, remember Allah with much remembrance." (Quran 33:41)',
    ru: '"О те, которые уверовали! Поминайте Аллаха многократно." (Коран 33:41)',
  ),
  QuoteItem(
    id: '"Maukah kuberitahukan amalan terbaik dan paling suci di sisi Rabbmu? Yaitu berdzikir kepada Allah." (HR. Tirmidzi no. 3377)',
    en: '"Shall I not inform you of the best of your deeds and the purest with your Master? The remembrance of Allah." (HR. Tirmidzi)',
    ru: '"Не сообщить ли вам о лучшем из ваших деяний и самом чистом перед вашим Владыкой? Поминание Аллаха." (Ат-Тирмизи)',
  ),
  QuoteItem(
    id: '"Dua kalimat yang ringan di lisan, berat di timbangan, dan dicintai Ar-Rahman: Subhanallahi wa bihamdih, Subhanallahil \'Azhim." (HR. Bukhari no. 6682)',
    en: '"Two words are light on the tongue, heavy on the scale, loved by the Most Merciful: Subhanallahi wa bihamdih, Subhanallahil \'Azhim." (HR. Bukhari)',
    ru: '"Два слова легки для языка, тяжелы на весах, любимы Милостивым: Субханаллахи уа бихамдихи, Субханаллахиль \'Азим." (Аль-Бухари)',
  ),
];

class RotatingQuoteWidget extends StatefulWidget {
  final AppLanguage currentLang;
  final LinearGradient? backgroundGradient;
  final IconData? timeIcon;

  const RotatingQuoteWidget({
    super.key,
    required this.currentLang,
    this.backgroundGradient,
    this.timeIcon,
  });

  @override
  State<RotatingQuoteWidget> createState() => _RotatingQuoteWidgetState();
}

class _RotatingQuoteWidgetState extends State<RotatingQuoteWidget> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoRotation();
  }

  void _startAutoRotation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted && _pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % quotesList.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = widget.backgroundGradient ??
        const LinearGradient(
          colors: [Color(0xFF0F5257), Color(0xFF064E3B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

    final timeIcon = widget.timeIcon ?? Icons.wb_sunny_rounded;
    final swipeText = AppTranslations.get('swipe_hint', widget.currentLang);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      height: 160,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withAlpha(70),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Background Watermark 1: Mosque Silhouette
            Positioned(
              right: -10,
              bottom: -15,
              child: Icon(
                Icons.mosque,
                size: 110,
                color: Colors.white.withAlpha(16),
              ),
            ),

            // Background Watermark 2: Sun / Moon / Sky Time Icon
            Positioned(
              left: -15,
              top: -15,
              child: Icon(
                timeIcon,
                size: 90,
                color: Colors.white.withAlpha(12),
              ),
            ),

            Column(
              children: [
                // Top Header Row inside Slider
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Row(
                    children: [
                      Icon(
                        timeIcon,
                        color: const Color(0xFFFDE68A),
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.format_quote_rounded,
                        color: Color(0xFFFDE68A),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(30),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withAlpha(50),
                            width: 0.6,
                          ),
                        ),
                        child: Text(
                          '${_currentIndex + 1} / ${quotesList.length}',
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.swipe_rounded,
                            size: 14,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            swipeText,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // PageView Quote Slider
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: quotesList.length,
                    itemBuilder: (context, index) {
                      final quoteText =
                          quotesList[index].getQuote(widget.currentLang);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Center(
                          child: Text(
                            quoteText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              height: 1.45,
                              letterSpacing: 0.2,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Bottom Animated Dot Indicators
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(quotesList.length, (index) {
                      final isActive = index == _currentIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: isActive ? 18 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFFFDE68A)
                              : Colors.white.withAlpha(70),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
