import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/appbar/tab_bar.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/search_container.dart';
import 'package:hazeupp/common/widgets/images/t_circular_image.dart';
import 'package:hazeupp/common/widgets/layouts/grid_layout.dart';
import 'package:hazeupp/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/enums.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: "Search in Store",
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Featured Brands
                      TSectionHeading(
                        title: "Featured Brands",
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: TRoundedContainer(
                                padding: const EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    // Icon
                                    Flexible(
                                      child: TCircularImage(
                                        isNetworkImage: false,
                                        image: TImages.clothIcon,
                                        backgroundColor: Colors.transparent,
                                        overlayColor:
                                            THelperFunctions.isDarkMode(context)
                                                ? TColors.white
                                                : TColors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                        width: TSizes.spaceBtwItems / 2),

                                    // Text
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TBrandTitleWithVerifiedIcon(
                                            title: "Nike",
                                            brandTextSize: TextSizes.large,
                                          ),
                                          Text(
                                            "256 Products",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),

                // Tabs
                bottom: TTabBar(
                  tabs: [
                    Tab(child: Text("TrackSuits")),
                    Tab(child: Text("T-Shirtd")),
                    Tab(child: Text("Shorts")),
                    Tab(child: Text("Joggers")),
                    Tab(child: Text("Orignals")),
                  ],
                ),
              ),
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}
