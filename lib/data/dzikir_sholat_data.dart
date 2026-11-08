import '../models/dzikir_model.dart';

/// Dzikir Setelah Shalat Fardhu
/// Referensi Resmi: Rumaysho.com (Ustadz Muhammad Abduh Tuasikal, MSc)
/// URL: https://rumaysho.com/1997-dzikir-setelah-shalat.html
const List<DzikirItem> dzikirSholatData = [
  DzikirItem(
    id: 1,
    titleId: 'Istighfar (3x) & Doa Kesejahteraan',
    titleEn: 'Istighfar (3x) & Prayer for Peace',
    titleRu: 'Истигфар (3 раза) и Молитва о Мире',
    arabic:
        'أَسْتَغْفِرُ اللهَ (3x)\n\nاَللَّهُمَّ أَنْتَ السَّلاَمُ، وَمِنْكَ السَّلاَمُ، تَبَارَكْتَ يَا ذَا الْجَلاَلِ وَاْلإِكْرَامِ',
    latin:
        'Astaghfirullah (3x).\nAllahumma antas salaam wa minkas salaam tabaarokta yaa dzal jalaali wal ikrom.',
    translationId:
        'Aku minta ampun kepada Allah (3x). Ya Allah, Engkau pemberi keselamatan, dan dari-Mu keselamatan, Maha Suci Engkau, wahai Tuhan Pemilik Keagungan dan Kemuliaan.',
    translationEn:
        'I ask Allah for forgiveness (3x). O Allah, You are Peace and from You is peace. Blessed are You, O Owner of Majesty and Honor.',
    translationRu:
        'Прошу прощения у Аллаха (3 раза). О Аллах, Ты — Мир, и от Тебя — мир! Благословен Ты, о Обладатель Величия и Почета!',
    readNoteId: 'Dibaca 1x (setelah salam)',
    readNoteEn: 'Recite 1x (after salam)',
    readNoteRu: 'Читать 1 раз',
    repeatCount: 1,
    narrator: 'HR. Muslim no. 591',
    status: 'Sahih',
    faedahId:
        'Rasulullah SAW jika selesai dari sholatnya beliau beristighfar sebanyak tiga kali dan membaca dzikir ini. (HR. Muslim no. 591).',
    faedahEn:
        'The Prophet (pbuh) used to ask forgiveness 3 times right after finishing prayer and recite this supplication.',
    faedahRu:
        'Пророк (мир ему) произносил истигфар 3 раза сразу setelah sholat и читал эту молитву.',
  ),
  DzikirItem(
    id: 2,
    titleId: 'Kalimat Tauhid & Pengakuan Kekuasaan Allah I',
    titleEn: 'Declaration of Tawheed & Sovereignty I',
    titleRu: 'Декларация Таухида и Власти Аллаха I',
    arabic:
        'لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ، اَللَّهُمَّ لاَ مَانِعَ لِمَا أَعْطَيْتَ، وَلاَ مُعْطِيَ لِمَا مَنَعْتَ، وَلاَ يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ',
    latin:
        'Laa ilaha illallah wahdahu laa syarika lah, lahul mulku wa lahul hamdu wa huwa \'ala kulli syai-in qodiir. Allahumma laa maani\'a limaa a\'thoyta wa laa mu\'thiya limaa mana\'ta wa laa yanfa\'u dzal jaddi minkal jaddu.',
    translationId:
        'Tiada Rabb yang berhak disembah selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya puji dan bagi-Nya kerajaan. Dia Maha Kuasa atas segala sesuatu. Ya Allah, tidak ada yang mencegah apa yang Engkau berikan dan tidak ada yang memberi apa yang Engkau cegah. Tidak berguna kekayaan dan kemuliaan itu bagi pemiliknya (selain iman dan amal shalih). Hanya dari-Mu kekayaan dan kemuliaan.',
    translationEn:
        'None has the right to be worshipped except Allah alone, without partner. To Him belongs sovereignty and praise, and He is over all things competent. O Allah, none can withhold what You give, and none can give what You withhold, nor can the wealth of the wealthy avail them against You.',
    translationRu:
        'Нет божества, кроме одного лишь Аллаха, у Которого нет сотоварища. Ему принадлежит власть, Ему хвала, и Он над всякой вещью мощен. О Аллах, никто не лишит того, что Ты даровал...',
    readNoteId: 'Dibaca 1x',
    readNoteEn: 'Recite 1x',
    readNoteRu: 'Читать 1 раз',
    repeatCount: 1,
    narrator: 'HR. Bukhari no. 844 & Muslim no. 593',
    status: 'Sahih',
    faedahId:
        'Dibaca oleh Rasulullah SAW di akhir setiap sholat fardhu. (HR. Bukhari no. 844 & Muslim no. 593).',
    faedahEn:
        'Recited by the Prophet (pbuh) at the end of every obligatory prayer.',
    faedahRu:
        'Произносилось Пророком (мир ему) в конце каждой обязательной молитвы.',
  ),
  DzikirItem(
    id: 3,
    titleId: 'Kalimat Tauhid & Pengakuan Kekuasaan Allah II',
    titleEn: 'Declaration of Tawheed & Reliance II',
    titleRu: 'Декларация Таухида и Упования II',
    arabic:
        'لاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ. لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللهِ، لاَ إِلَـهَ إِلاَّ اللهُ، وَلاَ نَعْبُدُ إِلاَّ إِيَّاهُ، لَهُ النِّعْمَةُ وَلَهُ الْفَضْلُ وَلَهُ الثَّنَاءُ الْحَسَنُ، لاَ إِلَـهَ إِلاَّ اللهُ مُخْلِصِيْنَ لَهُ الدِّيْنَ وَلَوْ كَرِهَ الْكَافِرُوْنَ',
    latin:
        'Laa ilaha illallah wahdahu laa syarika lah. Lahul mulku wa lahul hamdu wa huwa \'ala kulli syai-in qodiir. Laa hawla wa laa quwwata illa billah. Laa ilaha illallah wa laa na\'budu illa iyyaah. Lahun ni\'mah wa lahul fadhlu wa lahuts tsanaaul hasan. Laa ilaha illallah mukhlishiina lahud diin wa law karihal kaafiruun.',
    translationId:
        'Tiada Rabb (yang berhak disembah) kecuali Allah, Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya kerajaan dan pujaan. Dia Mahakuasa atas segala sesuatu. Tidak ada daya dan kekuatan kecuali (dengan pertolongan) Allah. Tiada Rabb (yang hak disembah) kecuali Allah. Kami tidak menyembah kecuali kepada-Nya. Bagi-Nya nikmat, anugerah dan pujaan yang baik. Tiada Rabb (yang hak disembah) kecuali Allah, dengan memurnikan ibadah kepada-Nya, sekalipun orang-orang kafir sama benci.',
    translationEn:
        'None has the right to be worshipped except Allah alone, without partner. To Him belongs sovereignty and praise, and He is over all things competent. There is no power and no strength except with Allah...',
    translationRu:
        'Нет божества, кроме одного лишь Аллаха, у Которого нет сотоварища. Ему принадлежит власть, Ему хвала... Нет мощи и силы ни у кого, кроме Аллаха...',
    readNoteId: 'Dibaca 1x',
    readNoteEn: 'Recite 1x',
    readNoteRu: 'Читать 1 раз',
    repeatCount: 1,
    narrator: 'HR. Muslim no. 594',
    status: 'Sahih',
    faedahId:
        'Dikatakan oleh Abdullah bin Zubair RA, Nabi SAW biasa membaca tahlil ini di akhir sholat. (HR. Muslim no. 594).',
    faedahEn:
        'Narrated by Abdullah bin Az-Zubair that the Prophet (pbuh) used to recite these words after every prayer.',
    faedahRu:
        'Передано Абдуллахом ибн Аз-Zубайром, что Пророк (мир ему) произносил эти слова после каждой молитвы.',
  ),
  DzikirItem(
    id: 4,
    titleId: 'Tasbih, Tahmid, Takbir (33x)',
    titleEn: 'Tasbih, Tahmid, Takbir (33x)',
    titleRu: 'Тасбих, Тахмид, Такбир (33 раза)',
    arabic:
        'سُبْحَانَ اللهِ (33x)\nاَلْحَمْدُ لِلَّهِ (33x)\nاَللهُ أَكْبَرُ (33x)\n\nPenutup ke-100:\nلاَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ',
    latin:
        'Subhanallah (33x), Alhamdu lillah (33x), Allahu akbar (33x).\nPenutup ke-100: Laa ilaha illallah wahdahu laa syarika lah. Lahul mulku wa lahul hamdu wa huwa \'ala kulli syai-in qodiir.',
    translationId:
        'Maha Suci Allah (33x), segala puji bagi Allah (33x), Allah Maha Besar (33x).\nPenutup ke-100: Tidak ada Rabb (yang berhak disembah) kecuali Allah Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya kerajaan. Bagi-Nya pujaan. Dia-lah Yang Mahakuasa atas segala sesuatu.',
    translationEn:
        'Glory be to Allah (33x), Praise be to Allah (33x), Allah is Most Great (33x).\n100th Seal: None has the right to be worshipped except Allah alone, without partner.',
    translationRu:
        'Пречист Аллах (33х), Хвала Аллаху (33х), Аллах Велик (33х).\n100-е Завершение: Нет божества, кроме одного лишь Аллаха.',
    readNoteId: 'Dibaca 33x + 1x Penutup',
    readNoteEn: 'Recite 33x + 1x Seal',
    readNoteRu: 'Читать 33 раза + 1 Завершение',
    repeatCount: 33,
    narrator: 'HR. Muslim no. 597',
    status: 'Sahih',
    faedahId:
        'Siapa yang membaca dzikir di atas setiap selesai sholat fardhu, maka dosa-dosanya diampuni walau sebanyak buih di lautan. (HR. Muslim no. 597).',
    faedahEn:
        'Whoever recites this after every obligatory prayer, his sins will be forgiven even if they are like the foam of the sea.',
    faedahRu:
        'Кто прочитает этот зикр после каждой обязательной молитвы, тому будут прощены грехи, даже если они будут подобны пене морской.',
  ),
  DzikirItem(
    id: 5,
    titleId: 'Ayat Kursi (QS. Al-Baqarah: 255)',
    titleEn: 'Ayat al-Kursi (Quran 2:255)',
    titleRu: 'Аят аль-Курси (Коран 2:255)',
    arabic:
        'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ',
    latin:
        'Allāhu lā ilāha illā huwal-ḥayyul-qayyūm, lā ta\'khużuhū sinatuw wa lā naūm, lahū mā fis-samāwāti wa mā fil-arḍ, man żal-lażī yasyfa\'u \'indahū illā bi\'iżnih, ya\'lamu mā baina aidīhim wa mā khalfahum, wa lā yuḥīṭūna bisyai\'im-min \'ilmihī illā bimā syā\', wasi\'a kursiyyuhus-samāwāti wal-arḍ, wa lā ya\'ūduhū ḥifẓuhumā, wa huwal-\'aliyyul-\'aẓīm.',
    translationId:
        'Allah, tidak ada tuhan selain Dia Yang Mahahidup, Yang terus-menerus mengurus (makhluk-Nya), tidak mengantuk dan tidak tidur. Milik-Nya apa yang ada di langit dan apa yang ada di bumi. Tidak ada yang dapat memberi syafaat di sisi-Nya tanpa izin-Nya. Dia mengetahui apa yang di hadapan mereka dan apa yang di belakang mereka, dan mereka tidak mengetahui sesuatu pun dari ilmu-Nya melainkan apa yang Dia kehendaki. Kursi-Nya meliputi langit dan bumi. Dan Dia tidak merasa berat memelihara keduanya, dan Dia Mahatinggi, Mahabesar.',
    translationEn:
        'Allah - there is no deity except Him, the Ever-Living, the Sustainer of all existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great.',
    translationRu:
        'Аллах — нет божества, кроме Него, Живого, Поддерживающего жизнь. Им не овладевает ни дремота, ни сон. Ему принадлежит то, что на небесах, и то, что на земле...',
    readNoteId: 'Dibaca 1x (setiap sholat fardhu)',
    readNoteEn: 'Recite 1x (after every prayer)',
    readNoteRu: 'Читать 1 раз',
    repeatCount: 1,
    narrator: 'HR. An-Nasa\'i dalam Al-Kubra 9:44',
    status: 'Sahih',
    faedahId:
        'Siapa membaca Ayat Kursi setiap selesai sholat fardhu, tidak ada yang menghalanginya masuk surga selain kematian. (HR. An-Nasa\'i & Bulughul Maram).',
    faedahEn:
        'Whoever recites Ayat al-Kursi after every obligatory prayer, nothing stands between him and entering Paradise except death.',
    faedahRu:
        'Кто читает Аят аль-Курси после каждой обязательной молитвы, того от входа в Рай отделяет только смерть.',
  ),
  DzikirItem(
    id: 6,
    titleId: 'Surat Al-Ikhlas, Al-Falaq, An-Naas (Mu\'awwidzat)',
    titleEn: 'Surah Al-Ikhlas, Al-Falaq, An-Nas',
    titleRu: 'Сура Аль-Ихлас, Аль-Фаляк, Ан-Нас',
    arabic:
        '1. قُلْ هُوَ اللّٰهُ اَحَدٌ ﴿١﴾ اَللّٰهُ الصَّمَدُ ﴿٢﴾ لَمْ يَلِدْ وَلَمْ يُوْلَدْ ﴿٣﴾ وَلَمْ يَكُنْ لَّهٗ كُفُوًا اَحَدٌ ﴿٤﴾\n\n2. قُلْ اَعُوْذُ بِرَبِّ الْفَلَقِ ﴿١﴾ مِنْ شَرِّ مَا خَلَقَ ﴿٢﴾ وَمِنْ شَرِّ غَاسِقٍ اِذَا وَقَبَ ﴿٣﴾ وَمِنْ شَرِّ النَّفّٰثٰتِ فَى الْعُقَدِ ﴿٤﴾ وَمِنْ شَرِّ حَاسِدٍ اِذَا حَسَدَ ﴿٥﴾\n\n3. قُلْ اَعُوْذُ بِرَبِّ النَّاسِ ﴿١﴾ مَلِكِ النَّاسِ ﴿٢﴾ اِلٰهِ النَّاسِ ﴿٣﴾ مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ﴿٤﴾ الَّذِيْ يُوَسْوِسُ فِيْ صُدُوْرِ النَّاسِ ﴿٥﴾ مِنَ الْجِنَّةِ وَالنَّاسِ ﴿٦﴾',
    latin:
        '1. Qul huwallāhu aḥad...\n2. Qul a\'ūżu birabbil-falaq...\n3. Qul a\'ūżu birabbin-nās...',
    translationId:
        'Membaca surat Al-Ikhlas, Al-Falaq, dan An-Naas setiap selesai sholat fardhu. (Tiga surat ini disebut Mu\'awwidzat).',
    translationEn:
        'Reciting Surah Al-Ikhlas, Al-Falaq, and An-Nas after every obligatory prayer. (These three surahs are called Mu\'awwidhat).',
    translationRu:
        'Чтение Суры Аль-Ихлас, Аль-Фаляк и Ан-Нас после каждой обязательной молитвы. (Эти три суры называются Муаввизат).',
    readNoteId: 'Dibaca 1x (setiap selesai sholat)',
    readNoteEn: 'Recite 1x (after every prayer)',
    readNoteRu: 'Читать 1 раз',
    repeatCount: 1,
    narrator: 'HR. Abu Daud no. 1523 & An-Nasa\'i no. 1337',
    status: 'Hasan',
    faedahId:
        'Membaca 3 surat perlindungan (Mu\'awwidzat) di setiap selesai sholat fardhu. (HR. Abu Daud no. 1523).',
    faedahEn:
        'Reciting the 3 protective surahs (Mu\'awwidhat) after every obligatory prayer.',
    faedahRu:
        'Чтение 3 защитных сур (Муаввизат) после каждой обязательной молитвы.',
  ),
  DzikirItem(
    id: 7,
    titleId: 'Doa Memohon Ilmu, Rezeki, & Amalan Diterima',
    titleEn: 'Prayer for Knowledge, Provision, & Accepted Deeds',
    titleRu: 'Молитва о Знании, Пропитании и Принятии Дел',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلاً مُتَقَبَّلاً',
    latin:
        'Allahumma inni as-aluka \'ilman naafi\'a, wa rizqon thoyyiba, wa \'amalan mutaqobbala.',
    translationId:
        'Ya Allah, sungguh aku memohon kepada-Mu ilmu yang bermanfaat (bagi diriku dan orang lain), rezeki yang halal dan baik, serta amal yang diterima (di sisi-Mu dan mendapatkan ganjaran yang baik). (Dibaca setelah salam dari sholat Shubuh).',
    translationEn:
        'O Allah, I ask You for beneficial knowledge, good provision, and accepted deeds. (Recited after salam from Dawn prayer).',
    translationRu:
        'О Аллах! Поистине, я прошу у Тебя полезного знания, благого пропитания и деяния, yang будет принято! (Читать setelah sholat Shubuh).',
    readNoteId: 'Dibaca 1x (Khusus Seusai Sholat Shubuh)',
    readNoteEn: 'Recite 1x (After Dawn Prayer)',
    readNoteRu: 'Читать 1 раз (После Утренней Молитвы)',
    repeatCount: 1,
    narrator: 'HR. Ibnu Majah no. 925 & Ahmad 6:305',
    status: 'Sahih',
    faedahId:
        'Dibaca oleh Nabi SAW setelah salam dari sholat Shubuh. (HR. Ibnu Majah no. 925 / Shahih Abu Thohir).',
    faedahEn:
        'Recited by the Prophet (pbuh) right after salam from Dawn prayer.',
    faedahRu: 'Произносилось Пророком (мир ему) сразу после утренней молитвы.',
  ),
];
