import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // tick :
  // from 0 to 1 :
  // when change value => use اخد قيم من controller واحطها فوق الاصل. :

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    // كل ثانيه بتحرك عقرب :
    initSlidingAnimations();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });

    // Navigator :
    navigateToHomeView();
  }

  // single Solid Princeplei :
  void navigateToHomeView() {
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouters.kHomeView);
      // Get.to(
      //   HomeView(),
      //   transition: Transition.fade,
      //   duration: kTransitionDuration,
      // );
    });
  }

  void initSlidingAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(minutes: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 4),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
