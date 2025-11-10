import '../../../path.dart';

class ListdataInHome extends StatefulWidget {
  ListdataInHome({
    super.key,
    required this.data,
  });
  Musicapp data;
  @override
  State<ListdataInHome> createState() => _ListdataInHomeState();
}

class _ListdataInHomeState extends State<ListdataInHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: ColorsApp().whiteColor),
        ),
        child: Row(
          children: [
            CustomText(
              text: widget.data.Name,
              color: ColorsApp().whiteColor,
              fontsize: CustomSize().fontsize_mediam(context),
            ),
          ],
        ),
      ),
    );
  }
}
