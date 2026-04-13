import 'package:czvirg_fo61b8e4bb982/core/constansts/color_manger.dart';
import 'package:czvirg_fo61b8e4bb982/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../core/resource/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  Future<void> initVideo() async {
    _controller = VideoPlayerController.asset(
      "assets/images/animatedCVlogo.mp4",
    );

    await _controller.initialize();
    await _controller.play();
    _controller.setLooping(false);

    _controller.addListener(() {
      final isFinished =
          _controller.value.position >= _controller.value.duration;

      if (isFinished && !_navigated && mounted) {
        _navigated = true;

        Navigator.pushReplacementNamed(context, RouteName.bottomNavRoute);
      }
    });

    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    Utils.setStatusBarStyle(ColorManager.whiteColor);

    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Center(
              child: SizedBox(
                width: double.infinity,
                height: 276.h,
                child: VideoPlayer(_controller),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
