import 'package:projucts_helper/path.dart';

class SystemSecret extends StatelessWidget {
  const SystemSecret({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar_Home(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30,
              ),
              child: Column(
                children: [
                  CustomText(
                    textAlign: TextAlign.center,
                    text: "سياسة الخصوصية",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.2,
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "مرحبًا بك في تطبيق أغاني مهرجانات بدون نت. تحرص moqysite على حماية خصوصيتك وبياناتك الشخصية أثناء استخدام التطبيق. باستخدامك للتطبيق، فإنك توافق على شروط هذه السياسة.",
                    color: ColorsApp().whiteColor.withOpacity(0.6),
                    fontsize: CustomSize().fontsize_mediam(context),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: "1. جمع البيانات",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.2,
                  ),

                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "التطبيق يعمل بدون اتصال بالإنترنت ويعتمد على الملفات المخزنة محليًا على جهازك.\n\nلا يتم جمع أي بيانات شخصية تلقائيًا، مثل الاسم أو البريد الإلكتروني أو الموقع الجغرافي، إلا إذا اخترت استخدام ميزات اختيارية تتطلب ذلك (مثل إرسال تقرير خطأ).",
                    color: ColorsApp().whiteColor.withOpacity(0.6),
                    fontsize: CustomSize().fontsize_mediam(context),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: "2. استخدام البيانات",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.2,
                  ),

                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "البيانات المخزنة محليًا تُستخدم فقط لتشغيل التطبيق وتحسين تجربة الاستماع، مثل قوائم الأغاني والإعدادات الشخصية.\n\nالتطبيق مخصص فقط لقوائم الأغاني، ولا يشمل أي محتوى آخر.\n\nإذا قمت بإرسال تقارير أعطال أو رسائل دعم، تُستخدم هذه المعلومات فقط لتحسين التطبيق وإصلاح المشاكل.",
                    color: ColorsApp().whiteColor.withOpacity(0.6),
                    fontsize: CustomSize().fontsize_mediam(context),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: "3. المشاركة مع أطراف أخرى",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.2,
                  ),

                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "لا نشارك بياناتك مع أي جهة خارجية لأغراض تجارية أو تسويقية.\n\nقد نكشف عن معلومات تقنية أو تقارير أعطال لمزودي خدمات محددين لتحسين جودة التطبيق أو للامتثال للقوانين إذا اقتضى الأمر.",
                    color: ColorsApp().whiteColor.withOpacity(0.6),
                    fontsize: CustomSize().fontsize_mediam(context),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: "4. الأمان",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.2,
                  ),

                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "البيانات المخزنة على جهازك محمية، لكن يرجى ملاحظة أن أي نظام إلكتروني لا يمكن ضمان أمانه بنسبة 100%.\n\nيمكنك حذف التطبيق أو مسح بياناته في أي وقت لإزالة المعلومات المحلية.",
                    color: ColorsApp().whiteColor.withOpacity(0.6),
                    fontsize: CustomSize().fontsize_mediam(context),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: "5. تحديثات السياسة",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.2,
                  ),

                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "قد يتم تعديل هذه السياسة من وقت لآخر. سيتم إشعار المستخدم عند وجود تغييرات جوهرية.",
                    color: ColorsApp().whiteColor.withOpacity(0.6),
                    fontsize: CustomSize().fontsize_mediam(context),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "تم إنشاء هذه السياسة بواسطة moqysite\nمدير الشركة: مدير الشركه\nمدير التطبيقات: جورج صبحي ",
                    color: ColorsApp().whiteColor,
                    fontsize: CustomSize().fontsize_mediam(context) * 1.1,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
