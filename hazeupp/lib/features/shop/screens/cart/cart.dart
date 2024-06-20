import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/icons/t_circular_icon.dart';
import 'package:hazeupp/common/widgets/images/t_rounded_image.dart';
import 'package:hazeupp/common/widgets/product_cart/add_remove_button.dart';
import 'package:hazeupp/common/widgets/product_cart/cart_item.dart';
import 'package:hazeupp/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:hazeupp/common/widgets/texts/t_product_price_text.dart';
import 'package:hazeupp/common/widgets/texts/t_product_title_text.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (_, index) => const Column(
            children: [
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      // Add Remove Button
                      TProductQuantityWithAddRemove(),
                    ],
                  ),
                  TProductPriceText(price: "650 "),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Checkout  ₺3675.0 "),
        ),
      ),
    );
  }
}
