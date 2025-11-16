import 'dart:async';
import 'dart:developer';

import 'package:projucts_helper/core/model/hide.dart';

import '../../../path.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  final AudioPlayer player = AudioPlayer();

  final TextEditingController controller = TextEditingController();
  var index1;
  double sliderValue = 0.0;
  Duration songDuration = Duration.zero;
  late List<Map<String, dynamic>> gorge;
  late Timer gorgef  ; 
  var data;
  @override
  void initState() {
    data = Musicapp.Music;
    super.initState();
     gorgef = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    gorgef.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FirstPageViews()),
        );
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 210),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final listg = data[index];
                  gorgelistgorge.listg = data;
                  return GestureDetector(
                    onTap: () async {
                      await audioHandler.setUrl(listg.Url, listg.Name);
                      await audioHandler.play();

                        Index.save(index); // ← تحديد الأغنية
                    },
                    child: ListdataInHome(data: listg, index: index),
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

        appBar: AppBar_Home(context, controller, (value) {
          setState(() {
            controller.text = value.toLowerCase();
            controller.text = value.toLowerCase();
            data = Musicapp.Music.where(
              (song) => song.Name.toLowerCase().contains(value.toLowerCase()),
            ).toList();
            log(data.toString());
          });
        }),
      ),
    );
  }
}
