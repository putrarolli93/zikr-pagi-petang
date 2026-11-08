import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controllers/language_controller.dart';
import '../models/dzikir_model.dart';
import '../utils/translations.dart';

class DzikirCardWidget extends StatefulWidget {
  final DzikirItem item;
  final Color primaryColor;

  const DzikirCardWidget({
    super.key,
    required this.item,
    required this.primaryColor,
  });

  @override
  State<DzikirCardWidget> createState() => _DzikirCardWidgetState();
}

class _DzikirCardWidgetState extends State<DzikirCardWidget> {
  int _currentCount = 0;
  final bool _showLatin = true;

  void _incrementCount() {
    setState(() {
      if (_currentCount < widget.item.repeatCount) {
        _currentCount++;
        HapticFeedback.lightImpact();
      } else {
        _currentCount = 0; // Reset after reaching total
      }
    });
  }

  void _resetCount() {
    setState(() {
      _currentCount = 0;
    });
  }

  void _showHadithDialog(BuildContext context, AppLanguage lang) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: EdgeInsets.only(
            top: 16,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: widget.primaryColor.withAlpha(25),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.auto_stories_rounded,
                              color: widget.primaryColor,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppTranslations.get('hadith_dalil', lang),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.item.narrator,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: widget.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.teal.shade50,
                              border: Border.all(color: Colors.teal.shade200),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              widget.item.status,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(
                        AppTranslations.get('hadith_faedah_title', lang),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Text(
                          widget.item.faedah(lang),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    AppTranslations.get('close', lang),
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
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = _currentCount >= widget.item.repeatCount;

    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.instance,
      builder: (context, lang, _) {
        return Card(
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
          shadowColor: Colors.black.withAlpha(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isCompleted
                    ? Colors.teal.shade300
                    : Colors.grey.shade200,
                width: isCompleted ? 1.5 : 1,
              ),
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Number, Title, Narrator & Repeat Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: widget.primaryColor,
                      child: Text(
                        '${widget.item.id}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.title(lang),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                widget.item.narrator,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: widget.primaryColor.withAlpha(20),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  widget.item.readNote(lang),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: widget.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Arabic Text Container (Font Kemenag RI / LPMQ_IsepMisbah)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? Colors.teal.shade50.withAlpha(80)
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isCompleted
                          ? Colors.teal.shade100
                          : Colors.grey.shade200,
                    ),
                  ),
                  child: Text(
                    widget.item.arabic,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontFamily: 'LPMQIsepMisbah',
                      fontSize: 26,
                      height: 2.2,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Transliteration Latin (Toggleable)
                if (_showLatin && widget.item.latin.isNotEmpty) ...[
                  Text(
                    widget.item.latin,
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: widget.primaryColor.withAlpha(200),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // Translation
                Text(
                  widget.item.translation(lang),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),

                // Bottom Actions Bar (Info Hadits Icon, Copy Button, Counter Button)
                Row(
                  children: [
                    // Info Hadits Button
                    IconButton.filledTonal(
                      tooltip: AppTranslations.get('hadith_dalil', lang),
                      icon: const Icon(Icons.info_outline_rounded, size: 20),
                      style: IconButton.styleFrom(
                        foregroundColor: widget.primaryColor,
                        backgroundColor: widget.primaryColor.withAlpha(20),
                      ),
                      onPressed: () => _showHadithDialog(context, lang),
                    ),

                    const SizedBox(width: 8),

                    // Copy Text Button
                    IconButton.filledTonal(
                      tooltip: 'Salin Teks',
                      icon: const Icon(Icons.copy_rounded, size: 18),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.grey.shade700,
                        backgroundColor: Colors.grey.shade100,
                      ),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                            text:
                                '${widget.item.title}\n\n${widget.item.arabic}\n\n${widget.item.translation}\n\n[${widget.item.narrator}]',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppTranslations.get('copied', lang)),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    // Interactive Counter Button (Penghitung Dzikir)
                    Material(
                      color: isCompleted
                          ? Colors.teal.shade600
                          : widget.primaryColor,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: _incrementCount,
                        onLongPress: _resetCount,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isCompleted
                                    ? Icons.check_circle_rounded
                                    : Icons.touch_app_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                isCompleted
                                    ? '${AppTranslations.get('done', lang)} ($_currentCount/${widget.item.repeatCount})'
                                    : '${AppTranslations.get('count', lang)} ($_currentCount/${widget.item.repeatCount})',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
