import '../controllers/language_controller.dart';

class DzikirItem {
  final int id;
  final String titleId;
  final String titleEn;
  final String titleRu;
  final String arabic;
  final String latin;
  final String translationId;
  final String translationEn;
  final String translationRu;
  final String readNoteId;
  final String readNoteEn;
  final String readNoteRu;
  final int repeatCount;
  final String narrator;
  final String status;
  final String faedahId;
  final String faedahEn;
  final String faedahRu;

  const DzikirItem({
    required this.id,
    required this.titleId,
    this.titleEn = '',
    this.titleRu = '',
    required this.arabic,
    required this.latin,
    required this.translationId,
    this.translationEn = '',
    this.translationRu = '',
    required this.readNoteId,
    this.readNoteEn = '',
    this.readNoteRu = '',
    this.repeatCount = 1,
    required this.narrator,
    this.status = 'Sahih',
    required this.faedahId,
    this.faedahEn = '',
    this.faedahRu = '',
  });

  String title(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.english:
        return titleEn.isNotEmpty ? titleEn : titleId;
      case AppLanguage.russian:
        return titleRu.isNotEmpty ? titleRu : titleId;
      default:
        return titleId;
    }
  }

  String translation(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.english:
        return translationEn.isNotEmpty ? translationEn : translationId;
      case AppLanguage.russian:
        return translationRu.isNotEmpty ? translationRu : translationId;
      default:
        return translationId;
    }
  }

  String faedah(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.english:
        return faedahEn.isNotEmpty ? faedahEn : faedahId;
      case AppLanguage.russian:
        return faedahRu.isNotEmpty ? faedahRu : faedahId;
      default:
        return faedahId;
    }
  }

  String readNote(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.english:
        return readNoteEn.isNotEmpty ? readNoteEn : readNoteId;
      case AppLanguage.russian:
        return readNoteRu.isNotEmpty ? readNoteRu : readNoteId;
      default:
        return readNoteId;
    }
  }
}
