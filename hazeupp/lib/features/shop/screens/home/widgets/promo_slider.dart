import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:hazeupp/common/widgets/images/t_rounded_image.dart';
import 'package:hazeupp/features/shop/controllers/home_controller.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: banners.map((url) => TRoundedImage(imageUrl: url)).toList()),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  TCircularConatiner(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
