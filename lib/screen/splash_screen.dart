import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: double.infinity,
      color: ColorManager.primary,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Center(child: Image.asset('$pngsPath/yofid_logo.png')),
          Image.asset(
            '$gifsPath/loading.gif',
            width: 10 * SizeConfig.blockSizeVertical!,
            height: 10 * SizeConfig.blockSizeVertical!,
          ),
        ],
      ),
    );
  }
}
