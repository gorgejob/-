class Musicapp {
  final String Url;
  final String Name;
  final bool isFavorite;

  Musicapp({required this.Url, required this.Name, this.isFavorite = false});

  Map<String, dynamic> toJson() => {
    'Url': Url,
    'Name': Name,
    'isFavorite': isFavorite,
  };
  // تحويل Map إلى كائن
  factory Musicapp.fromJson(Map<String, dynamic> json) => Musicapp(
    Url: json['Url'],
    Name: json['Name'],
    isFavorite: json['isFavorite'] ?? false,
  );

  static List<Musicapp> Music = [
    Musicapp(Url: "assets/1.mp3", Name: "اجانص", isFavorite: false),
    Musicapp(Url: "assets/2.mp3", Name: "يا زميلي ", isFavorite: false),
    Musicapp(
      Url: "assets/3.m4a",
      Name: "اتخدعتو فى هدوئى وسكوتى",
      isFavorite: false,
    ),
    Musicapp(Url: "assets/4.m4a", Name: "اسمي مشرف جيهتي", isFavorite: false),
    Musicapp(Url: "assets/5.m4a", Name: "اعقل يا غشيم", isFavorite: false),
    Musicapp(
      Url: "assets/6.mp3",
      Name: "الحب الحب سينيوريتا",
      isFavorite: false,
    ),
    Musicapp(Url: "assets/7.m4a", Name: "الحبسة موضه", isFavorite: false),
    Musicapp(
      Url: "assets/8.m4a",
      Name: "العقل شاط والقلب مات",
      isFavorite: false,
    ),
    Musicapp(
      Url: "assets/9.m4a",
      Name: "العودة من بعد الغياب",
      isFavorite: false,
    ),
    Musicapp(Url: "assets/10.mp3", Name: "اللي جاي بتاعي", isFavorite: false),
    Musicapp(Url: "assets/11.mp3", Name: "انا البطل", isFavorite: false),
    Musicapp(Url: "assets/12.m4a", Name: "انا الطرش", isFavorite: false),
    Musicapp(Url: "assets/13.m4a", Name: "انا بخطف الانظار", isFavorite: false),
    Musicapp(Url: "assets/14.mp3", Name: "كاتم الانفاس", isFavorite: false),
    Musicapp(Url: "assets/15.m4a", Name: "كاتم ع النفس", isFavorite: false),
    Musicapp(
      Url: "assets/16.m4a",
      Name: "ملناش كبير كبيرنا فوق",
      isFavorite: false,
    ),
    Musicapp(Url: "assets/17.m4a", Name: "دكن دكن", isFavorite: false),
    Musicapp(Url: "assets/18.mp3", Name: "بعبع دايرتي", isFavorite: false),
    Musicapp(
      Url: "assets/19.m4a",
      Name: "انا لبسي الشيك غرك فيا",
      isFavorite: false,
    ),
    Musicapp(
      Url: "assets/20.m4a",
      Name: "انا لبسي اوفر سايز",
      isFavorite: false,
    ),
    Musicapp(
      Url: "assets/21.m4a",
      Name: "انا مش ديلر ي حكومه",
      isFavorite: false,
    ),
    Musicapp(Url: "assets/22.m4a", Name: "انا متلف كوكبي ", isFavorite: false),
    Musicapp(Url: "assets/23.m4a", Name: "انتا هتيجي معايا", isFavorite: false),
    Musicapp(Url: "assets/24.m4a", Name: "رجع القائد", isFavorite: false),
    Musicapp(
      Url: "assets/25.m4a",
      Name: "سوري مبردش انا بستوري",
      isFavorite: false,
    ),
    Musicapp(Url: "assets/26.m4a", Name: "عشري يبعني انا", isFavorite: false),
    Musicapp(
      Url: "assets/27.mp3",
      Name: "محكمه ودخلنا علي المفرمه",
      isFavorite: false,
    ),
    Musicapp(
      Url: "assets/28.mp3",
      Name: "غيبنا وغاب الابداع",
      isFavorite: false,
    ),
    Musicapp(
      Url: "assets/29.m4a",
      Name: "انا شاب شكلو بقا اكبر من سنو",
      isFavorite: false,
    ),
    Musicapp(
      Url: "assets/30.mp3",
      Name: "اول قفا يا بروسلي",
      isFavorite: false,
    ),
  ];
}
