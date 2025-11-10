import 'package:projucts_helper/path.dart';

class ErrorMessager {
  static Future ErrorMessage(BuildContext context, String text) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // margin: EdgeInsets.only(bottom: 90),
        // behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.symmetric(vertical: 20),
        content: CustomText(
          text: text,
          color: ColorsApp().whiteColor,
          fontsize: CustomSize().fontsize_mediam(context),
        ),
      ),
    );
  }
}
