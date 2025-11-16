import 'package:projucts_helper/core/Projuct_Core/index.dart';
import 'package:projucts_helper/core/model/hide.dart';
import 'package:projucts_helper/core/model/musicapp.dart';
import 'package:projucts_helper/main.dart';

class playere {
  static Future<void> nextSong() async {
    Index.indexs = Index.indexs + 1;
    late int cursentIndex = Index.indexs;
    {
      await audioHandler.setUrl(
        gorgelistgorge.listg[cursentIndex].Url,
        gorgelistgorge.listg[cursentIndex].Name,
      );
    }
  }

  static Future<void> backSong() async {
    Index.indexs = Index.indexs - 1;
    if(Index.indexs == -1){
      Index.indexs = Musicapp.Music.length - 1;
    }

    late int cursentIndex = Index.indexs;
    if (cursentIndex != 0) {
      await audioHandler.setUrl(
        gorgelistgorge.listg[cursentIndex].Url,
        gorgelistgorge.listg[cursentIndex].Name,
      );
    } else {}
  }
}
