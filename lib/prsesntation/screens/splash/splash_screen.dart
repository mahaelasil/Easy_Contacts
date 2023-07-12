import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants.dart';
import '../../styles/colors.dart';
import '../../widgets/defult_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);


    Timer(
      const Duration(milliseconds: 4000),
          () => Navigator.pushNamedAndRemoveUntil(
          context, homeLayout, (route) => false),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [skyBlue, lightSkyBlue, skyBlue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 30.h,
                width: 70.w,
              ),
              DefaultText(
                text: 'Easy Contacts',
                textColor: darkPurple,
                textSize: 25.sp,
                weight: FontWeight.bold,
                textStyle: FontStyle.italic,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}