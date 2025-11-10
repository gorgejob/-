import 'package:projucts_helper/core/Projuct_Core/index.dart';
import 'package:projucts_helper/core/model/musicapp.dart';
import 'package:projucts_helper/main.dart';

class playere {
  static Future<void> nextSong() async {
    late int cursentIndex = Index.indexs;
    {
      audioHandler.setUrl(Musicapp.Music[cursentIndex].Url , Musicapp.Music[cursentIndex ].Name);
    }
  }

  static Future<void> backSong() async {
    late int cursentIndex = Index.indexs;
    if (cursentIndex != 0) {
      audioHandler.setUrl(Musicapp.Music[cursentIndex - 1].Url , Musicapp.Music[cursentIndex -1].Name);
    } else {}
  }
}
