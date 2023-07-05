import 'package:flutter/material.dart';

import '../../widgets/splah_view_body/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'Splash View';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
