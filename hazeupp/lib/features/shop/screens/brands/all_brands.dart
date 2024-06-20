import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/layouts/grid_layout.dart';
import 'package:hazeupp/common/widgets/products/product_cards/brand_card.dart';
import 'package:hazeupp/common/widgets/products/sortable/t_sortable_products.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/features/shop/screens/brands/brand_products.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Drop Down
              // DropdownButtonFormField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Iconsax.sort),
              //   ),
              //   onChanged: (value) {},
              //   items: [
              //     "Name",
              //     "Higher Price",
              //     "Lower Price",
              //     "Newest",
              //     "Popularity"
              //   ]
              //       .map((option) =>
              //           DropdownMenuItem(value: option, child: Text(option)))
              //       .toList(),
              // ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Heading
              TSectionHeading(title: "Brands", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Brannds
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
