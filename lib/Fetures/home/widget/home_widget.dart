import 'package:projucts_helper/core/model/hide.dart';

import '../../../path.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.ontap, required this.text});
  final void Function() ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          color: ColorsApp().whiteColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsApp().whiteColor, width: 2),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Center(
          child: CustomText(
            textAlign: TextAlign.center,

            text: text,
            color: ColorsApp().whiteColor,
            fontsize: CustomSize().fontsize_mediam(context) * 0.9,
          ),
        ),
      ),
    );
  }
}

class slide extends StatefulWidget {
  double sliderValue;

  var songDuration;

  AudioPlayer player;

  slide({
    Key? key,
    required this.sliderValue,
    required this.songDuration,
    required this.player,
  }) : super(key: key);

  @override
  State<slide> createState() => SlideState();
}

class SlideState extends State<slide> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp().whiteColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: ColorsApp().whiteColor, width: 2),
        ),
        child: Slider(
          thumbColor: Colors.red,
          inactiveColor: Colors.black,
          activeColor: ColorsApp().whiteColor,
          value: widget.sliderValue,
          min: 0,
          max: widget.songDuration,
          onChanged: (value) async {
            setState(() {
              widget.sliderValue = value;
            });
            await widget.player.seek(Duration(seconds: value.toInt()));
          },
        ),
      ),
    );
  }
}

class EndPartPage extends StatefulWidget {
  const EndPartPage({super.key});

  @override
  State<EndPartPage> createState() => _EndPartPageState();
}

class _EndPartPageState extends State<EndPartPage> {
  bool playing = false;

  @override
  void initState() {
    super.initState();


    // استماع لحالة المشغل
    audioHandler.player.playerStateStream.listen((event) {
      final isPlaying = event.playing;
      if (mounted) {
        setState(() {
          playing = isPlaying;
        });
      }
      debugPrint("Playing: $playing");
    });
  }

  void _playPause() {
    final player = audioHandler.player;
    final duration = player.duration;
    final index =Index.indexs;
    if (duration != null) {
      if (playing) {
        player.pause();
      } else {
        player.play();
      }
    } else {
       audioHandler.setUrl( gorgelistgorge.listg[index].Url, gorgelistgorge.listg[index].Name);
        player.play();
    }
  }

  void _skipNext() {
    final player = audioHandler.player;
    final duration = player.duration;
    final position = player.position;

    if (duration != null && position != null) {
      if (position >= duration) {
        playere.nextSong();
      } else {
        player.seek(duration);
      }
    } else {
      debugPrint("لا توجد أغنية لتخطيها");
      ErrorMessager.ErrorMessage(context, "يرجي اختيار اغنية");
    }
  }

  void _skipPrevious() {
    final player = audioHandler.player;
    final position = player.position;
    final duration = player.duration;

    if (position != null && duration != null) {
      if (position.inSeconds.toDouble() == 0) {
        playere.backSong();
      } else {
        player.seek(Duration.zero);
      }
    } else {
      debugPrint("لا توجد أغنية للعودة إليها");
      ErrorMessager.ErrorMessage(context, "يرجي اختيار اغنية");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // زر السابق
        GestureDetector(
          onTap: _skipPrevious,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsApp().whiteColor, width: 2),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.skip_previous, color: Colors.white, size: 35),
            ),
          ),
        ),

        const SizedBox(width: 50),

        // زر التشغيل/الإيقاف المؤقت
        GestureDetector(
          onTap: _playPause,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsApp().whiteColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                playing ? Icons.pause : Icons.play_arrow,
                color: ColorsApp().whiteColor,
                size: 50,
              ),
            ),
          ),
        ),

        const SizedBox(width: 50),

        // زر التالي
        GestureDetector(
          onTap: _skipNext,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsApp().whiteColor, width: 2),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.skip_next, color: Colors.white, size: 35),
            ),
          ),
        ),
      ],
    );
  }
}
