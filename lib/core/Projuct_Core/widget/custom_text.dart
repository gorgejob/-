import '../../../path.dart';
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontsize,
  });
  final String text;
  final Color color;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
      ),
    );
  }
}
