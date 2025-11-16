import 'package:flutter/cupertino.dart';
import 'package:projucts_helper/Fetures/Started/views/system_secret.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../path.dart';

class FirstPageViews extends StatelessWidget {
   FirstPageViews({super.key});
    final Uri url = Uri.parse(
    "https://play.google.com/store/apps/dev?id=6206543452590598359",
  );

  Future<void> _launchUrl() async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }


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
              textAlign: TextAlign.center,
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
                    ontap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SystemSecret()),
                      );
                    },
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
                      Share.share("https://play.google.com/store/apps/details?id=com.example.projucts_helper&pcampaignid=web_share", subject: "gorge");
                    },
                    text: "مشاركة التطبيق",
                    icon: Icon(Icons.share),
                    coloricon: Colors.blue,
                  ),
                  SizedBox(width: CustomSize().width(context) * 0.07),
                  FirstPageWidget(
                    ontap: ()=> launchUrl(url) ,
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
