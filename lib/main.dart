import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:size_setter/size_setter.dart';
import 'package:tikichat_app/DI/locator.dart';
import 'package:tikichat_app/Utils/constants.dart';
import 'package:tikichat_app/Utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //세로화면 고정(태블릿 제외)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initLocator();

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
