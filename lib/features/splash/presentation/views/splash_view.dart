import 'package:bookly/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // تحسين اداء التطبيق بشكل عالي اتبع قواعد معينه :
    return Scaffold(body: SplashViewBody());
  }
}
