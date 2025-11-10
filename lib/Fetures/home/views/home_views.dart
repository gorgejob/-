import 'dart:developer';
import '../../../path.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  final AudioPlayer player = AudioPlayer();
  var index1;
  double sliderValue = 0.0;
  Duration songDuration = Duration.zero;
  late List<Map<String, dynamic>> gorge;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: ListView.builder(
              itemCount: Musicapp.Music.length,
              itemBuilder: (context, index) {
                final data = Musicapp.Music[index];
                Index.save(index);
                log(Index.indexs.toString());
                return GestureDetector(
                  onTap: () async {
                    await audioHandler.setUrl(Musicapp.Music[index].Url ,Musicapp.Music[index].Name );
                    audioHandler.play();
                    Index.save(index);
                  },
                  child: ListdataInHome(data: data),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Bottomnavigationbar_home(
              sliderValue: sliderValue,
              songDuration: songDuration,
              player: player,
            ),
          ),
        ],
      ),

      appBar: AppBar_Home(context, player),
    );
  }
}
