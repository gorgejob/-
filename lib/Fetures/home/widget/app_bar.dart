import '../../../path.dart';

AppBar AppBar_Home(BuildContext context , TextEditingController? controller , void Function(String)? onChanged) {
  return AppBar(
    shape: Border(bottom: BorderSide(color: ColorsApp().whiteColor)),
    toolbarHeight: 90,
    backgroundColor: Colors.black,
    title: TextField(
      onChanged: onChanged,
      controller: controller,
      style: TextStyle(
        color: ColorsApp().whiteColor,
        fontSize: CustomSize().fontsize_small(context) * 1.2,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: "ابحث علي اغنيتك المفضلة",
        hintStyle: TextStyle(
          color: ColorsApp().whiteColor,
          fontSize: CustomSize().fontsize_small(context) * 1.2,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp().whiteColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp().whiteColor),
        ),
      ),
      cursorColor: ColorsApp().whiteColor,
    ),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FirstPageViews()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorsApp().whiteColor),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.navigate_next_rounded,
              color: ColorsApp().whiteColor,
              size: 50,
            ),
          ),
        ),
      ),
    ],
  );
}
