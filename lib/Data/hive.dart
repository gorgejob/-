import 'package:hive_flutter/hive_flutter.dart';
import 'package:projucts_helper/core/model/musicapp.dart';

class InitHive {
  static late Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox("gorge");
  }

  // التحقق من وجود بيانات favorite أو وضع القيمة الافتراضية
  static Future<void> check() async {
    if (box.get("favorite") == null || box.get("favorite").isEmpty) {
      await box.put(
        "favorite",
        Musicapp.Music.map((e) => e.toJson()).toList(),
      );
    }
  }

  static List<Musicapp> loadFavoriteBox() {
    List<dynamic> rawData = box.get("favorite", defaultValue: []);
    return rawData
        .map((e) => Musicapp.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  static Future<void> saveIndex(int index) async {
    await box.put("index", index);
  }

  static int loadIndex() {
    return box.get("index", defaultValue: 0);
  }

  static Future<void> addFavorite(Musicapp song) async {
    List<dynamic> favorite = box.get("favorite", defaultValue: []);
    // تحديث القيمة بدل الإضافة المكررة
    int i = favorite.indexWhere((e) =>
        Map<String, dynamic>.from(e)['Name'] == song.Name);
    if (i != -1) {
      // Toggle favorite
      Map<String, dynamic> map = Map<String, dynamic>.from(favorite[i]);
      map['favorite'] = !(map['favorite'] as bool);
      favorite[i] = map;
    } else {
      favorite.add(song.toJson());
    }
    await box.put("favorite", favorite);
  }
}
