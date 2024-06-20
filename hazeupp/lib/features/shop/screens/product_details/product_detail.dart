import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/bottom_add_to_cart_widget.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/product_attribute.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/product_image_slider.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/rating_and_share.dart';
import 'package:hazeupp/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            const TProductImageSlider(),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // rating and share
                  TRatingandShare(),

                  // price, title, stock and share
                  TProductMetaData(),

                  // Attributes
                  ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Checkout"))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Description
                  const TSectionHeading(
                      title: "Description", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    "The black Nike tracksuit is a stylish and comfortable athletic wear set, ideal for both workouts and casual outings. It features a sleek, black design with the iconic Nike logo prominently displayed on the chest and thigh.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
