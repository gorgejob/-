import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import '../../../path.dart';

class FirstPageViews extends StatelessWidget {
  const FirstPageViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: CustomSize().height(context) * 0.15,
            left: 0,
            right: 0,
            child: Image.asset(
              varibles.pathImageApp,
              height: CustomSize().height(context) * 0.3,
            ),
          ),
          Positioned(
            top: CustomSize().height(context) * 0.48,
            left: 0,
            right: 0,
            child: CustomText(
              text: varibles.NameProjuct,
              color: ColorsApp().whiteColor,
              fontsize: CustomSize().fontsize_large(context) * 1.2,
            ),
          ),
          Positioned(
            bottom: CustomSize().height(context) * 0.21,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  FirstPageWidget(
                    ontap: () {},
                    text: "سياسية الخصوصية",
                    icon: Icon(CupertinoIcons.lock),
                    coloricon: Colors.yellow,
                  ),
                  SizedBox(width: CustomSize().width(context) * 0.07),
                  FirstPageWidget(
                    ontap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeViews()),
                      );
                    },
                    text: "ابدا التشغيل",
                    icon: Icon(CupertinoIcons.play),
                    coloricon: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: CustomSize().height(context) * 0.03,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  FirstPageWidget(
                    ontap: () {
                      Share.share("gorge", subject: "gorge");
                    },
                    text: "مشاركة التطبيق",
                    icon: Icon(Icons.share),
                    coloricon: Colors.blue,
                  ),
                  SizedBox(width: CustomSize().width(context) * 0.07),
                  FirstPageWidget(
                    ontap: () {
                      ErrorMessager.ErrorMessage(
                        context,
                        "سوف يتم اضفاتها لاحقا",
                      );
                    },
                    text: "تطبيقات اخري",
                    icon: Icon(Icons.window_rounded),
                    coloricon: ColorsApp().whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
