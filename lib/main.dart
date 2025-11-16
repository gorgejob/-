import 'package:audio_service/audio_service.dart';
import 'package:projucts_helper/Data/audio_handler.dart';
import 'package:projucts_helper/Data/hive.dart';
import '../../../path.dart';

late AudioPlayerHandler audioHandler;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.audio',
      androidNotificationChannelName: 'تشغيل الصوت 🎧',
      androidNotificationOngoing: true, // الإشعار يفضل ظاهر أثناء التشغيل
      androidStopForegroundOnPause: true,
    ),
  );
  await InitHive.init();
  await InitHive.check();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.beirutiTextTheme()),
      locale: const Locale('ar', 'EG'), // 🇪🇬 اللغة العربية
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      localizationsDelegates: [
        // دول بيخلوا التطبيق يدعم الاتجاه RTL تلقائي
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Audio Service Demo',
      home:  SplashViews(),
    );
  }
}
