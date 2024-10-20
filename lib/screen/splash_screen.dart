import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:dailynews/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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

    Future.delayed(const Duration(seconds: 1)).then((_) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRouter.onBoardingRouter, (route) => false);
    });
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
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top +
                    5 * SizeConfig.blockSizeVertical!),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight!,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 44, 21, 94),
                  Color.fromARGB(220, 44, 21, 94),
                  Color.fromARGB(200, 44, 21, 94),
                  Color.fromARGB(180, 130, 36, 67),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(4.2 * SizeConfig.blockSizeVertical!),
                bottomRight:
                    Radius.circular(4.2 * SizeConfig.blockSizeVertical!),
              ),
            ),
          ),
          Center(
              child: SvgPicture.asset(
            '$svgsPath/logo1.svg',
            width: 12 * SizeConfig.blockSizeVertical!,
            height: 12 * SizeConfig.blockSizeVertical!,
          )),
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
