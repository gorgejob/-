import '../../../path.dart';

class FirstPageWidget extends StatelessWidget {
  const FirstPageWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.coloricon,
    required this.ontap,
  });
  final String text;
  final Icon icon;
  final Color coloricon;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: CustomSize().height(context) * 0.16,
        width: CustomSize().width(context) * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(0.2),
          border: Border.all(color: ColorsApp().whiteColor, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon.icon,
              color: coloricon,
              size: CustomSize().fontsize_large(context) * 1,
            ),
            SizedBox(height: 20),
            CustomText(
              text: text,
              color: ColorsApp().whiteColor,
              fontsize: CustomSize().fontsize_small(context) * 1.2,
            ),
          ],
        ),
      ),
    );
  }
}
