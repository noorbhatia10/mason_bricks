import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImageLoading extends StatelessWidget {
  const ShimmerImageLoading({
    this.imageUrl,
    this.height,
    this.width,
    this.onClick,
    this.borderRadius = BorderRadius.zero,
    this.fallbackImageUrl =
        'https://via.placeholder.com/728x600.png?text="No Image"',
    Key? key,
    this.fit,
    this.logoColor,
  }) : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final VoidCallback? onClick;
  final BorderRadius? borderRadius;
  final String fallbackImageUrl;
  final BoxFit? fit;
  final Color? logoColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl.or(fallbackImageUrl),
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          color: logoColor,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            direction: ShimmerDirection.rtl,
            period: const Duration(milliseconds: 1000),
            child: SizedBox(
              width: width,
              height: height,
            ),
          ),
          errorWidget: (context, url, dynamic error) => CachedNetworkImage(
            imageUrl: fallbackImageUrl.orEmpty,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CircularShimmerImageLoading extends StatelessWidget {
  const CircularShimmerImageLoading({
    this.imageUrl,
    this.size,
    this.onClick,
    this.fallbackImageUrl =
        'https://via.placeholder.com/728x600.png?text="No Image"',
    Key? key,
    this.fit,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final String? imageUrl;
  final double? size;
  final VoidCallback? onClick;
  final String fallbackImageUrl;
  final BoxFit? fit;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ClipOval(
        child: Padding(
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: imageUrl.or(fallbackImageUrl),
            width: size,
            height: size,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              direction: ShimmerDirection.rtl,
              period: const Duration(milliseconds: 1000),
              child: SizedBox(
                width: size,
                height: size,
              ),
            ),
            errorWidget: (context, url, dynamic error) => CachedNetworkImage(
              imageUrl: fallbackImageUrl.orEmpty,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
