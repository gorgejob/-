import 'package:flutter/cupertino.dart';
import '../../../path.dart';

class SplashViews extends StatefulWidget {
  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}

class _SplashViewsState extends State<SplashViews>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstPageViews()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 200,
            right: 0,
            left: 0,
            child: Image.asset(varibles.NameProjuct, height: 300),
          ),
          Positioned(
            bottom: 250,
            right: 0,
            left: 0,
            child: CupertinoActivityIndicator(
              animating: true,
              color: ColorsApp().whiteColor,
              radius: 20,
            ),
          ),
          Positioned(
            bottom: 150,
            right: 0,
            left: 0,
            child: CustomText(
              text: "يرجي الانتظار ......",
              color: ColorsApp().whiteColor,
              fontsize: CustomSize().fontsize_large(context),
            ),
          ),
        ],
      ),
    );
  }
}
