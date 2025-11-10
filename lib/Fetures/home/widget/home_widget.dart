import 'dart:developer';
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

class endpartpage extends StatefulWidget {
  const endpartpage({super.key});

  @override
  State<endpartpage> createState() => _endpartpageState();
}

class _endpartpageState extends State<endpartpage> {
  late bool Playing = false;
  @override
  void initState() {
    super.initState();
    audioHandler.player.playerStateStream.listen((event) {
      if (event.playing) {
        log("true");
        setState(() {
          Playing = true;
        });
        log(Playing.toString());
      } else {
        log("false");
        setState(() {
          Playing = false;
        });
        log(Playing.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (audioHandler.player.position.inSeconds.toDouble() == 0) {
              playere.backSong();
            } else {
              audioHandler.player.seek(Duration.zero);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsApp().whiteColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.skip_next,
                color: ColorsApp().whiteColor,
                size: 35,
              ),
            ),
          ),
        ),
        SizedBox(width: 50),
        GestureDetector(
          onTap: () {
            if (audioHandler.player.duration != null) {
              Playing
                  ? audioHandler.player.pause()
                  : audioHandler.player.play();
            } else {
              log("false");
              ErrorMessager.ErrorMessage(context, "يرجي اختيار اغنية");
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsApp().whiteColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Playing ? Icons.pause : Icons.play_arrow,
                color: ColorsApp().whiteColor,
                size: 50,
              ),
            ),
          ),
        ),
        SizedBox(width: 50),
        GestureDetector(
          onTap: () {
            if (audioHandler.player.position.inSeconds.toDouble() ==
                audioHandler.player.duration) {
              playere.nextSong();
            } else {
              audioHandler.player.seek(audioHandler.player.duration);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorsApp().whiteColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.skip_previous,
                color: ColorsApp().whiteColor,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
