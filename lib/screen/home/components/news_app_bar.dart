import 'dart:ui';

import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:dailynews/presentation/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsAppBar extends StatelessWidget {
  const NewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4.2 * SizeConfig.blockSizeVertical!),
              bottomRight: Radius.circular(4.2 * SizeConfig.blockSizeVertical!),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                width: SizeConfig.screenWidth,
                height: 14 * SizeConfig.blockSizeVertical!,
                color:
                    Colors.black.withOpacity(0.1), // Adjust opacity as needed
                child: Image.asset(
                  "$pngsPath/appbar_image.jpeg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top +
                  2.6 * SizeConfig.blockSizeVertical!,
              right: 5.2 * SizeConfig.blockSizeHorizontal!,
              left: 5.2 * SizeConfig.blockSizeHorizontal!,
            ),
            width: SizeConfig.screenWidth,
            height: 14 * SizeConfig.blockSizeVertical!,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 83, 21, 94),
                  Color.fromARGB(220, 83, 21, 94),
                  Color.fromARGB(200, 83, 21, 94),
                  Color.fromARGB(200, 177, 49, 92),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("$svgsPath/logo.svg"),
                    Text(
                      "News",
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 3 * SizeConfig.blockSizeVertical!,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
