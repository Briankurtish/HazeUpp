import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/search_container.dart';
import 'package:hazeupp/common/widgets/layouts/grid_layout.dart';
import 'package:hazeupp/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:hazeupp/features/shop/screens/home/widgets/home_categories.dart';
import 'package:hazeupp/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderPrimaryContainer(
              child: Column(
                children: [
                  // AppBar
                  const THomeAppBar(),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Search Bar
                  const TSearchContainer(
                    text: "Search in Store",
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        const TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.banner3,
                      TImages.banner2
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Heading
                  TSectionHeading(
                    title: "Popular Products",
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Popular Products
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => TProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
