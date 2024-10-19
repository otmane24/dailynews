import 'package:dailynews/assistant_methode/size_config.dart';

import 'package:dailynews/models/source_model.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';

class SourceContainer extends StatelessWidget {
  SourceModel source;
  Function(SourceModel?) onTap;
  bool isSelected;
  SourceContainer(
      {required this.source,
      required this.onTap,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isSelected ? onTap(null) : onTap(source),
      child: Container(
          decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 83, 21, 94)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: ColorManager.shadowColor)
              ]),
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!),
          child: Row(
            children: [
              Text(
                source.name!,
                style: TextStyle(
                    color:
                        !isSelected ? ColorManager.black : ColorManager.white),
              ),
              if (isSelected)
                Row(
                  children: [
                    SizedBox(
                      width: .4 * SizeConfig.blockSizeHorizontal!,
                    ),
                    Icon(
                      Icons.close,
                      color: ColorManager.white,
                      size: 4 * SizeConfig.blockSizeHorizontal!,
                    ),
                  ],
                )
            ],
          )),
    );
  }
}
