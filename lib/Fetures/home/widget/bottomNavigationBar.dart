import 'dart:developer';
import '../../../path.dart';

class Bottomnavigationbar_home extends StatefulWidget {
  double sliderValue;

  var songDuration;

  AudioPlayer player;

  Bottomnavigationbar_home({
    Key? key,
    required this.sliderValue,
    required this.songDuration,
    required this.player,
  }) : super(key: key);

  @override
  State<Bottomnavigationbar_home> createState() =>
      _Bottomnavigationbar_homeState();
}

class _Bottomnavigationbar_homeState extends State<Bottomnavigationbar_home> {
  late bool palying = false;
  late var data;
  @override
  void initState() {
    super.initState();
    audioHandler.player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        log(Index.indexs.toString());
        log(Musicapp.Music.length.toString());

        if (Index.indexs + 1 == Musicapp.Music.length) {
          Index.indexs = 0;
          playere.nextSong();
        } else {
          Index.indexs = Index.indexs + 1;
          playere.nextSong();
        }
      }
    });
  }

  @override
  void dispose() {
    widget.player.dispose();
    palying = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: ColorsApp().whiteColor)),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          StreamBuilder<Duration>(
            stream: audioHandler.player.positionStream,
            builder: (context, snapshot) {
              final position = snapshot.data ?? Duration.zero;
              final duration = audioHandler.player.duration ?? Duration.zero;

              return Column(
                children: [
                  slide(
                    sliderValue: position.inSeconds.toDouble().clamp(
                      0,
                      duration.inSeconds.toDouble(),
                    ),
                    songDuration: duration.inSeconds.toDouble(),
                    player: audioHandler.player,
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 30),
          endpartpage(),
        ],
      ),
    );
  }
}
