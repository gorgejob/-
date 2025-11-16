import 'package:projucts_helper/Data/hive.dart';
import '../../../path.dart';

class ListdataInHome extends StatefulWidget {
  ListdataInHome({super.key, required this.data, required this.index});
  Musicapp data;
  int index;
  @override
  State<ListdataInHome> createState() => _ListdataInHomeState();
}

class _ListdataInHomeState extends State<ListdataInHome> {
  final gorge = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          color: Index.indexs == widget.index
              ? ColorsApp().whiteColor.withOpacity(0.2)
              : Colors.black,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: ColorsApp().whiteColor),
        ),
        child: Row(
          children: [
            CustomText(
              textAlign: TextAlign.center,
              text: widget.data.Name,
              color: ColorsApp().whiteColor,
              fontsize: CustomSize().fontsize_mediam(context),
            ),
            Spacer(),
            IconButton(
              onPressed: () async {
                await InitHive.addFavorite(widget.data);
                setState(() {});
              },
              icon: Icon(
                Icons.favorite,
                size: 30,

                color: gorge ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  