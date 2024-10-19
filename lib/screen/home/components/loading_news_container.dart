import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingNewsContainer extends StatelessWidget {
  const LoadingNewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                blurRadius: 4, spreadRadius: 0, color: ColorManager.shadowColor)
          ]),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: ColorManager.grey200.withOpacity(.2),
                child: Container(
                  width: 12 * SizeConfig.blockSizeVertical!,
                  height: 12 * SizeConfig.blockSizeVertical!,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManager.white,
                  ),
                ),
              ),
              SizedBox(
                width: 1.6 * SizeConfig.blockSizeHorizontal!,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: ColorManager.grey200.withOpacity(.2),
                      child: Container(
                        height: 1.4 * SizeConfig.blockSizeVertical!,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .4 * SizeConfig.blockSizeVertical!,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: ColorManager.grey200.withOpacity(.2),
                      child: Container(
                        width: 40 * SizeConfig.blockSizeHorizontal!,
                        height: 1.4 * SizeConfig.blockSizeVertical!,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.8 * SizeConfig.blockSizeVertical!,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: ColorManager.grey200.withOpacity(.2),
                      child: Container(
                        height: 1.4 * SizeConfig.blockSizeVertical!,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .4 * SizeConfig.blockSizeVertical!,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: ColorManager.grey200.withOpacity(.2),
                      child: Container(
                        height: 1.4 * SizeConfig.blockSizeVertical!,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .4 * SizeConfig.blockSizeVertical!,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: ColorManager.grey200.withOpacity(.2),
                      child: Container(
                        height: 1.4 * SizeConfig.blockSizeVertical!,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: ColorManager.shadowColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: ColorManager.grey200.withOpacity(.2),
                child: Container(
                  width: 20 * SizeConfig.blockSizeHorizontal!,
                  height: 1.4 * SizeConfig.blockSizeVertical!,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorManager.white,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: ColorManager.grey200.withOpacity(.2),
                child: Container(
                  width: 20 * SizeConfig.blockSizeHorizontal!,
                  height: 1.4 * SizeConfig.blockSizeVertical!,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorManager.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
