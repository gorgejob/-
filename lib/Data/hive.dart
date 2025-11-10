import 'package:hive_flutter/hive_flutter.dart';

class init_hive {
  static var box;
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox("gorge");
    box = Hive.box("gorge");
  }

  static Future<void> save_index(int index) async {
    await box.put("index", index);
  }

  static Future<int> load_index() async {
    var index;
    await Future.delayed(Duration(seconds: 15)).then((value) async {
      index = await box.get("index") ?? 0;
    });
    return await index;
  }
}
