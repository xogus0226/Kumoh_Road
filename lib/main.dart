import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kumoh_road/providers/user_providers.dart';
import 'package:kumoh_road/screens/launch_screens/intro_screen.dart';
import 'package:kumoh_road/utilities/material_color_utile.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white,));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  KakaoSdk.init(nativeAppKey: 'c7b475e5111b80916e28e5e364d62631');

  await NaverMapSdk.instance.initialize(
      clientId: 't2v0aiyv0u',
      onAuthFailed: (ex) {
        print("네이버맵 로그인 오류 : $ex");
      }
  );

  runApp(
    ChangeNotifierProvider(create: (context) => UserProvider(), child: const KumohRoad(),
    ),
  );
}


class KumohRoad extends StatelessWidget {
  const KumohRoad({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KumohRoad',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF3F51B5))
      ),
      home: const IntroScreen(),
    );
  }
}
