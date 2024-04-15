import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jala/shared/utils.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? radius;

  const CachedImage({
    super.key,
    required this.url,
    this.width = 32,
    this.height = 32,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius ?? BorderRadius.circular(99),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              getImageAsset(assetName: 'placeholder.png'),
            ),
          ),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius ?? BorderRadius.circular(99),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
