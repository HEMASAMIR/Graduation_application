import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/firebase_options.dart';
import 'package:riders_app/modules/splash_view/splash_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riders_app/services/user_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // tp launch Hive engine with application .
  await Hive.initFlutter();
  // to initialize all user data variables .
  await UserDatabase.instance.initUserInfo();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const RidersApp());
}

class RidersApp extends StatelessWidget {
  const RidersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
