import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';
import '../../core/generated/assets.dart';
import 'splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState
    extends PageLifeCycleState<SplashController, SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesLogoVertical,
              height: 200.h,
              color: context.colors.primary,
            ),
            SizedBox(height: 100.h),
            LoadingAnimationWidget.stretchedDots(
              color: context.colors.primary,
              size: 80.r,
            ),
          ],
        ),
      ),
    );
  }
}
