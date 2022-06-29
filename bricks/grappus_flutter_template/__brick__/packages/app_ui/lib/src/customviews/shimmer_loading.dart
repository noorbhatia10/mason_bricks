import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 22,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 10,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                        Container(
                          width: double.infinity,
                          height: 10,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                        Container(
                          width: 60,
                          height: 8,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerListLoadingPage2 extends StatelessWidget {
  const ShimmerListLoadingPage2({
    this.itemCount = 10,
    Key? key,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: itemCount,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 22,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 10,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                        Container(
                          width: double.infinity,
                          height: 10,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        ),
                        Container(
                          width: 60,
                          height: 8,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: .7,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(8, (index) {
        return Shimmer.fromColors(
          baseColor: AppColors.white,
          period: const Duration(milliseconds: 1000),
          highlightColor: Colors.grey[300]!,
          child: Container(
            height: 170,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
        );
      }),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    this.height = 100,
    this.width = 150,
  }) : super(key: key);
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: AppColors.white,
      ),
    );
  }
}

class ShimmerGridView extends StatelessWidget {
  const ShimmerGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.only(bottom: screenSize.height * 0.1),
        mainAxisSpacing: screenSize.height * 0.018,
        crossAxisSpacing: screenSize.width * 0.013,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: screenSize.width * 0.275,
            height: screenSize.height * 0.29,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.3),
              color: AppColors.white,
            ),
          ),
        ),
        itemCount: 6,
        shrinkWrap: true,
      ),
    );
  }
}

class ShimmerListViewLoadingPage extends StatelessWidget {
  const ShimmerListViewLoadingPage({
    this.padding = 10,
    this.width = 200,
    this.itemCount = 4,
  });

  final double padding;
  final double width;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.only(
          right: screenSize.width * 0.043,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(padding),
          width: width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: 3,
      ),
    );
  }
}

class UserTaskListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: AppColors.black,
        padding:
            EdgeInsets.only(top: screenSize.height * .031, left: 20, right: 20),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.white38,
              highlightColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.grey2.withOpacity(.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.grey2.withOpacity(.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: screenSize.height * .480,
              width: screenSize.width,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 19),
              decoration: BoxDecoration(
                color: AppColors.grey2.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),
                  Shimmer.fromColors(
                    baseColor: Colors.white38,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 160,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.grey2.withOpacity(.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Shimmer.fromColors(
                    baseColor: Colors.white38,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.grey2.withOpacity(.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Shimmer.fromColors(
                    baseColor: Colors.white38,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 160,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.grey2.withOpacity(.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Shimmer.fromColors(
                        baseColor: Colors.white38,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 55,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.grey2.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
