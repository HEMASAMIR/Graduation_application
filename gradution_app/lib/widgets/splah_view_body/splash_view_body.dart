import 'package:flutter/material.dart';
import 'package:gradution_app/utils/images_utils/images_helper.dart';
import 'package:gradution_app/pages/auth_screen.dart';
import 'package:gradution_app/widgets/splah_view_body/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // animation
  late AnimationController animationController; // value 0,1
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    animationController.forward();
    getToAuth();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void getToAuth() {
    Future.delayed(const Duration(seconds: 10),
        () => Navigator.pushNamed(context, AuthView.id));
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward(); // for initlizing
    // animationController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesApp.image1),
            const SizedBox(
              height: 10,
            ),
            SlidingText(slidingAnimation: slidingAnimation)
          ],
        ));
  }
}
