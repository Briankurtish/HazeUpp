import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/brands/brand_show_case.dart';
import 'package:hazeupp/common/widgets/layouts/grid_layout.dart';
import 'package:hazeupp/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/features/shop/models/category_model.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //  Brands
              TBrandShowCase(
                images: [
                  TImages.productImage0,
                  TImages.productImage1,
                  TImages.productImage2,
                ],
              ),
              TBrandShowCase(
                images: [
                  TImages.productImage3,
                  TImages.productImage6,
                  TImages.productImage8,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Products you may like
              TSectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
