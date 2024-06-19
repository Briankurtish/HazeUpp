import 'package:flutter/material.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/product_attribute.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/product_image_slider.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:hazeupp/features/shop/screens/product_details/widget/rating_and_share.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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

                  // Checkout button

                  // Description

                  // Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
