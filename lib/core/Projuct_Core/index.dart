import 'dart:developer';

class Index {
  static var indexs;
  static Future<void> save(int index) async {
    log(index.toString());
    indexs = index;
  }

}
