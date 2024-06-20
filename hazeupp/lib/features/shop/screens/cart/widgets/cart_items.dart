import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/product_cart/add_remove_button.dart';
import 'package:hazeupp/common/widgets/product_cart/cart_item.dart';
import 'package:hazeupp/common/widgets/texts/t_product_price_text.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),
          if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButtons)
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
    );
  }
}
