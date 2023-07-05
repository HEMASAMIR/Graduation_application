import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/firebase_options.dart';
import 'package:gradution_app/pages/my_splash/splash_view.dart';
import 'package:gradution_app/pages/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const GraduationProject());
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      routes: {
        SplashView.id: (context) => const SplashView(),
        AuthView.id: (context) => const AuthView(),
      },
    );
  }
}
