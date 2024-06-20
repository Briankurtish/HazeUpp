import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/product_cart/add_remove_button.dart';
import 'package:hazeupp/common/widgets/product_cart/cart_item.dart';
import 'package:hazeupp/common/widgets/texts/t_product_price_text.dart';
import 'package:hazeupp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:hazeupp/features/shop/screens/checkout/checkout.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

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
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Text("Checkout  ₺3675.0 "),
        ),
      ),
    );
  }
}
