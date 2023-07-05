import 'package:flutter/material.dart';
import 'package:riders_app/modules/home_page/home_page.dart';
import 'package:riders_app/services/user_db.dart';
import 'package:riders_app/shared/widget/auth_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        /**
         * if user registered , then move to home page .
         * else , move to register page .
         */
        UserDatabase.instance.userRegistered
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ))
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthView(),
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/logo.png',
              height: 250,
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'World\'s Largest online food app.',
                style: TextStyle(
                    fontFamily: 'Signatra',
                    color: Colors.black38,
                    fontSize: 24,
                    letterSpacing: 3),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
