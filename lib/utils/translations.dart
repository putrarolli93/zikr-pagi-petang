import '../controllers/language_controller.dart';

class AppTranslations {
  static String get(String key, AppLanguage lang) {
    final map = _data[key];
    if (map == null) return key;
    return map[lang] ?? map[AppLanguage.indonesia] ?? key;
  }

  static const Map<String, Map<AppLanguage, String>> _data = {
    'app_title': {
      AppLanguage.indonesia: 'Dzikir Pagi & Petang',
      AppLanguage.english: 'Morning & Evening Zikr',
      AppLanguage.russian: 'Утренние и Вечерние Зикры',
    },
    'greeting': {
      AppLanguage.indonesia: 'السلام عليكم ورحمة الله وبركاته',
      AppLanguage.english: 'السلام عليكم ورحمة الله وبركاته',
      AppLanguage.russian: 'السلام عليكم ورحمة الله وبركاته',
    },
    'sub_greeting': {
      AppLanguage.indonesia: 'Basahi lisanmu dengan mengingat Allah',
      AppLanguage.english: 'Moisten your tongue with the remembrance of Allah',
      AppLanguage.russian: 'Увлажняйте свой язык поминанием Аллаха',
    },
    'time_morning': {
      AppLanguage.indonesia: 'Selamat Pagi 🌅',
      AppLanguage.english: 'Good Morning 🌅',
      AppLanguage.russian: 'Доброе Утро 🌅',
    },
    'time_afternoon': {
      AppLanguage.indonesia: 'Selamat Siang ☀️',
      AppLanguage.english: 'Good Afternoon ☀️',
      AppLanguage.russian: 'Добрый День ☀️',
    },
    'time_evening': {
      AppLanguage.indonesia: 'Selamat Petang 🌆',
      AppLanguage.english: 'Good Evening 🌆',
      AppLanguage.russian: 'Добрый Вечер 🌆',
    },
    'time_night': {
      AppLanguage.indonesia: 'Selamat Malam 🌙',
      AppLanguage.english: 'Good Night 🌙',
      AppLanguage.russian: 'Доброй Ночи 🌙',
    },
    'main_menu': {
      AppLanguage.indonesia: 'Menu Utama',
      AppLanguage.english: 'Main Menu',
      AppLanguage.russian: 'Главное Меню',
    },
    'dzikir_pagi': {
      AppLanguage.indonesia: 'Dzikir Pagi',
      AppLanguage.english: 'Morning Zikr',
      AppLanguage.russian: 'Утренний Зикр',
    },
    'dzikir_pagi_sub': {
      AppLanguage.indonesia: 'Dibaca antara waktu Subuh hingga terbit matahari',
      AppLanguage.english: 'Recited between Dawn (Fajr) and Sunrise',
      AppLanguage.russian: 'Читается от Рассвета (Фаджр) до Восхода',
    },
    'dzikir_petang': {
      AppLanguage.indonesia: 'Dzikir Petang',
      AppLanguage.english: 'Evening Zikr',
      AppLanguage.russian: 'Вечерний Зикр',
    },
    'dzikir_petang_sub': {
      AppLanguage.indonesia: 'Dibaca antara waktu Ashar hingga terbenam matahari',
      AppLanguage.english: 'Recited between Asr and Sunset (Maghrib)',
      AppLanguage.russian: 'Читается от Асра до Заката (Магриб)',
    },
    'dzikir_sholat': {
      AppLanguage.indonesia: 'Dzikir setelah Sholat',
      AppLanguage.english: 'Zikr After Prayer',
      AppLanguage.russian: 'Зикры После Молитвы',
    },
    'dzikir_sholat_sub': {
      AppLanguage.indonesia: 'Dibaca seusai sholat fardhu 5 waktu',
      AppLanguage.english: 'Recited after the 5 obligatory prayers',
      AppLanguage.russian: 'Читается после 5 обязательных молитв',
    },
    'recitations_count': {
      AppLanguage.indonesia: 'Bacaan Dzikir Lengkap',
      AppLanguage.english: 'Complete Zikr Recitations',
      AppLanguage.russian: 'Полных Зикров',
    },
    'settings': {
      AppLanguage.indonesia: 'Pengaturan',
      AppLanguage.english: 'Settings',
      AppLanguage.russian: 'Настройки',
    },
    'about_app': {
      AppLanguage.indonesia: 'Tentang Aplikasi',
      AppLanguage.english: 'About App',
      AppLanguage.russian: 'О Приложении',
    },
    'contact_us': {
      AppLanguage.indonesia: 'Hubungi Kami',
      AppLanguage.english: 'Contact Us',
      AppLanguage.russian: 'Связаться с нами',
    },
    'contact_us_sub': {
      AppLanguage.indonesia: 'developers@appmuslim.com',
      AppLanguage.english: 'developers@appmuslim.com',
      AppLanguage.russian: 'developers@appmuslim.com',
    },
    'email_copied': {
      AppLanguage.indonesia: 'Email developers@appmuslim.com berhasil disalin',
      AppLanguage.english: 'Email developers@appmuslim.com copied to clipboard',
      AppLanguage.russian: 'Email developers@appmuslim.com скопирован',
    },
    'select_language': {
      AppLanguage.indonesia: 'Pilih Bahasa Utama',
      AppLanguage.english: 'Select Primary Language',
      AppLanguage.russian: 'Выберите Основной Язык',
    },
    'welcome_first_time': {
      AppLanguage.indonesia: 'Selamat Datang di Dzikir App',
      AppLanguage.english: 'Welcome to Zikr App',
      AppLanguage.russian: 'Добро Пожаловать в Зикр Приложение',
    },
    'language_notice': {
      AppLanguage.indonesia:
          'Pilih bahasa terjemahan yang Anda inginkan. Bahasa ini dapat diubah kapan saja nanti di menu Pengaturan (Setting).',
      AppLanguage.english:
          'Choose your preferred translation language. You can change this language anytime later in the Settings page.',
      AppLanguage.russian:
          'Выберите предпочитаемый язык перевода. Вы можете изменить этот язык в любое время позже на странице Настроек.',
    },
    'continue_button': {
      AppLanguage.indonesia: 'Simpan & Lanjutkan',
      AppLanguage.english: 'Save & Continue',
      AppLanguage.russian: 'Сохранить и Продолжить',
    },
    'quote': {
      AppLanguage.indonesia:
          '"Ingatlah Aku, niscaya Aku ingat (pula) kepadamu." (QS. Al-Baqarah: 152)',
      AppLanguage.english:
          '"So remember Me; I will remember you." (Quran 2:152)',
      AppLanguage.russian:
          '"Поминайте Меня, и Я буду помнить о вас." (Коран 2:152)',
    },
    'hadith_dalil': {
      AppLanguage.indonesia: 'Dalil & Faedah Hadits',
      AppLanguage.english: 'Hadith Proof & Benefits',
      AppLanguage.russian: 'Доказательство и Польза Хадиса',
    },
    'hadith_faedah_title': {
      AppLanguage.indonesia: 'Keutamaan / Faedah Dzikir:',
      AppLanguage.english: 'Virtues & Benefits of Zikr:',
      AppLanguage.russian: 'Достоинство и Польза Зикра:',
    },
    'close': {
      AppLanguage.indonesia: 'Tutup',
      AppLanguage.english: 'Close',
      AppLanguage.russian: 'Закрыть',
    },
    'copied': {
      AppLanguage.indonesia: 'Dzikir berhasil disalin',
      AppLanguage.english: 'Zikr copied to clipboard',
      AppLanguage.russian: 'Зикр скопирован в буфер обмена',
    },
    'count': {
      AppLanguage.indonesia: 'Hitung',
      AppLanguage.english: 'Count',
      AppLanguage.russian: 'Считать',
    },
    'done': {
      AppLanguage.indonesia: 'Selesai',
      AppLanguage.english: 'Completed',
      AppLanguage.russian: 'Завершено',
    },
    'app_description': {
      AppLanguage.indonesia:
          'Aplikasi Dzikir Pagi & Petang ini dirancang untuk memudahkan umat Islam dalam mengamalkan dzikir harian sesuai sunnah Rasulullah SAW.',
      AppLanguage.english:
          'This Morning & Evening Zikr application is designed to make it easy for Muslims to practice daily zikr according to the Sunnah.',
      AppLanguage.russian:
          'Это приложение Утренних и Вечерних Зикров разработано для того, чтобы мусульманам было легко практиковать ежедневный зикр по Сунне.',
    },
    'app_version': {
      AppLanguage.indonesia: 'Versi 1.0.0',
      AppLanguage.english: 'Version 1.0.0',
      AppLanguage.russian: 'Версия 1.0.0',
    },
    'description_title': {
      AppLanguage.indonesia: 'Deskripsi',
      AppLanguage.english: 'Description',
      AppLanguage.russian: 'Описание',
    },
    'key_features': {
      AppLanguage.indonesia: 'Fitur Utama',
      AppLanguage.english: 'Key Features',
      AppLanguage.russian: 'Основные Функции',
    },
    'correction_notice_title': {
      AppLanguage.indonesia: 'Saran & Koreksi Penulisan',
      AppLanguage.english: 'Suggestions & Text Corrections',
      AppLanguage.russian: 'Предложения и Исправление Текста',
    },
    'correction_notice_desc': {
      AppLanguage.indonesia:
          'Jika Anda menemukan kesalahan penulisan lafaz, harakat, transliterasi, atau terjemahan, mohon berkenan menghubungi kami melalui email agar dapat segera kami perbaiki.',
      AppLanguage.english:
          'If you find any typos, diacritical errors, transliteration, or translation mistakes, please kindly contact us via email so we can fix them promptly.',
      AppLanguage.russian:
          'Если вы обнаружите ошибки в тексте, огласовках, транслитерации или переводе, пожалуйста, свяжитесь с нами по электронной почте, чтобы мы могли оперативно их исправить.',
    },
    'swipe_hint': {
      AppLanguage.indonesia: 'Geser',
      AppLanguage.english: 'Swipe',
      AppLanguage.russian: 'Свайп',
    },
  };
}
