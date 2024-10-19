import 'dart:ui';

import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:dailynews/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: ColorManager.textRed,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRouter.homeRouter, (router) => false);
            },
            color: ColorManager.textRed,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(3 * SizeConfig.blockSizeHorizontal!)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                "Get Started",
                key: ValueKey<String>("Get Started"),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight!,
              color: Colors.black.withOpacity(0.1), // Adjust opacity as needed
              child: Image.asset(
                "$pngsPath/appbar_image.jpeg",
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("$svgsPath/logo1.svg"),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4 * SizeConfig.blockSizeHorizontal!,
                      vertical: 11.5 * SizeConfig.blockSizeVertical!),
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "News\n",
                              style: TextStyle(
                                color: ColorManager.textRed,
                                backgroundColor: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 14 * SizeConfig.blockSizeHorizontal!,
                                fontStyle: FontStyle.italic,
                              ),
                              children: [
                            TextSpan(
                              text: "arrond the world ",
                              style: TextStyle(
                                color: ColorManager.white,
                                backgroundColor: Colors.transparent,
                                fontWeight: FontWeight.w800,
                                fontSize: 14 * SizeConfig.blockSizeHorizontal!,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: "for you",
                              style: TextStyle(
                                color: ColorManager.textRed,
                                backgroundColor: Colors.transparent,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorManager.white,
                                fontSize: 14 * SizeConfig.blockSizeHorizontal!,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: 3 * SizeConfig.blockSizeVertical!,
                      ),
                      Text(
                        "Best time to read, take your time to read a little more from this world !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorManager.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 2.8 * SizeConfig.blockSizeVertical!),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
