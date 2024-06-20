import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/layouts/grid_layout.dart';
import 'package:hazeupp/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Drop Down
        DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {},
          items: ["Name", "Higher Price", "Lower Price", "Newest", "Popularity"]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // Products
        TGridLayout(
            itemCount: 8, itemBuilder: (_, index) => TProductCardVertical()),
      ],
    );
  }
}
