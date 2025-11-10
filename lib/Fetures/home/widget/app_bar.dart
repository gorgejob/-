import '../../../path.dart';

AppBar AppBar_Home(BuildContext context, ) {
  return AppBar(
    shape: Border(bottom: BorderSide(color: ColorsApp().whiteColor)),
    toolbarHeight: 90,
    backgroundColor: Colors.black,
    title: CustomText(
      textAlign: TextAlign.center,
      text: varibles.NameProjuct,
      color: ColorsApp().whiteColor,
      fontsize: CustomSize().fontsize_large(context) * 0.89,
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
