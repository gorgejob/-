class Musicapp {
  final String Url;
  final String Name;

  Musicapp({required this.Url, required this.Name});

  // تحويل للكائن إلى Map
  Map<String, dynamic> toJson() => {'Url': Url, 'Name': Name};

  // تحويل Map إلى كائن
  factory Musicapp.fromjson(Map<String, dynamic> json) =>
      Musicapp(Url: json['Url'], Name: json['Name']);

  static List<Musicapp> Music = [
    Musicapp(Url: "assets/gorge1.mp3", Name: "اجانص"),
    Musicapp(Url: "assets/gorge3.mp3", Name: "يا زميلي"),
    Musicapp(Url: "assets/gorge6.mp3", Name: "سقفة ورا سقفة"),
    Musicapp(Url: "assets/gorge8.mp3", Name: "انا و انت اتنين مساكين"),

  ];
}
