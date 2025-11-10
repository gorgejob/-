import '../../../path.dart';

class CustomSize {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double scale(BuildContext context) => MediaQuery.of(context).textScaleFactor;
  double sizetext(BuildContext context) => width(context) / scale(context);

  fontsize_small(BuildContext context) => sizetext(context) * 0.04;
  fontsize_mediam(BuildContext context) => sizetext(context) * 0.055;
  fontsize_large(BuildContext context) => sizetext(context) * 0.08;
}
