import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:size_setter/size_setter.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Utils/constants.dart';
import 'package:tikichat_app/Utils/router.dart';
import 'package:tikichat_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  await FirebaseCrashlytics.instance.recordError(Exception(), null, fatal: true);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  //세로화면 고정(태블릿 제외)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initLocator();
  KakaoSdk.init(nativeAppKey: 'f010e2cf91863a1122f3ef2526ba2716');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      deviceHeight = MediaQuery.sizeOf(context).height;
      deviceWidth = MediaQuery.sizeOf(context).width;
      textScale = MediaQuery.textScalerOf(context);
      isRotate = false;

      if (MediaQuery.orientationOf(context) == Orientation.landscape) {
        isRotate = true;
      }
      return SizeSetter(
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(fontFamily: "Urbanist", colorScheme: null),
          routerConfig: router,
        ),
      );
    });
  }
}
