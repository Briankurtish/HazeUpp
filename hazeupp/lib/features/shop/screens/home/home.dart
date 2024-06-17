import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/search_container.dart';
import 'package:hazeupp/features/shop/screens/home/widgets/home_appbar.dart';
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
                  THomeAppBar(),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Search Bar
                  TSearchContainer(
                    text: "Search in Store",
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
