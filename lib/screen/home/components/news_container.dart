import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailynews/assistant_methode/size_config.dart';
import 'package:dailynews/models/news_model.dart';
import 'package:dailynews/presentation/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  NewsModel newsInfo;
  NewsContainer({required this.newsInfo, super.key});
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(Uri.parse(newsInfo.url!)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: ColorManager.shadowColor)
            ]),
        padding: EdgeInsets.all(2.4 * SizeConfig.blockSizeHorizontal!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: newsInfo.urlToImage!,
                    width: 12 * SizeConfig.blockSizeVertical!,
                    height: 12 * SizeConfig.blockSizeVertical!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error_outline,
                      size: 48,
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
                      Text(
                        newsInfo.title!,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 3.6 * SizeConfig.blockSizeHorizontal!,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.titleBlue),
                      ),
                      SizedBox(
                        height: .4 * SizeConfig.blockSizeVertical!,
                      ),
                      Text(
                        newsInfo.description!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 3.6 * SizeConfig.blockSizeHorizontal!,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: ColorManager.shadowColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(
                    'dd MMM. yyyy',
                  ).format(DateTime.parse(newsInfo.publishedAt!)),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorManager.textRed,
                      fontSize: 3 * SizeConfig.blockSizeHorizontal!),
                ),
                SizedBox(
                  width: 2 * SizeConfig.blockSizeHorizontal!,
                ),
                Expanded(
                  child: Text(
                    "By ${newsInfo.source!}",
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorManager.textRed,
                        fontSize: 3 * SizeConfig.blockSizeHorizontal!),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
