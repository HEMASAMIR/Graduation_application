import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, child) => SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'Sell Food Outline',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Signatra',
              letterSpacing: 5,
              color: Colors.black45,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
