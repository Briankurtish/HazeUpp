// import 'package:flutter/foundation.dart';
// import 'package:hazeupp/features/authentication/models/user_model.dart';
// import 'package:hazeupp/features/shop/models/category_model.dart';
// import 'package:hazeupp/utils/constants/enums.dart';
// import 'package:hazeupp/utils/constants/image_strings.dart';

// class TDummyData {
//   // Banners
//   static final List<BannerModel> banners = [
//     BannerModel(
//         imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
//     BannerModel(
//         imageUrl: TImages.banner2, targetScreen: TRoutes.order, active: false),
//     BannerModel(
//         imageUrl: TImages.banner3, targetScreen: TRoutes.order, active: false),
//     BannerModel(
//         imageUrl: TImages.banner4, targetScreen: TRoutes.order, active: false),
//     BannerModel(
//         imageUrl: TImages.banner5, targetScreen: TRoutes.order, active: false),
//     BannerModel(
//         imageUrl: TImages.banner6, targetScreen: TRoutes.order, active: false),
//     BannerModel(
//         imageUrl: TImages.banner7, targetScreen: TRoutes.order, active: false),
//   ];

//   // User
//   static final UserModel user = UserModel(
//     id: id,
//     firstName: "John",
//     lastName: "Doe",
//     username: "JohnDoe9",
//     email: "johnDoe@gmail.com",
//     phoneNumber: "+9034576534",
//     profilePicture: TImages.user,
//     addresses: [
//       AddressModel(
//         id: "1",
//         name: "John",
//         phoneNumber: "+9034576534",
//         street: '83465 Kaliland',
//         city: 'Famagusta',
//         state: "Famagusta",
//         country: "Cyprus",
//       ),
//       AddressModel(
//         id: "2",
//         name: "Kerry Thomas",
//         phoneNumber: "+9034576534",
//         street: '83465 Guzelyurt',
//         city: 'Lefkosia',
//         state: "Nicosia",
//         country: "Cyprus",
//       ),
//       AddressModel(
//         id: "3",
//         name: "Denis Hans",
//         phoneNumber: "+9034576534",
//         street: '83465 Ortakoy',
//         city: 'Girne',
//         state: "Kyrenia",
//         country: "Cyprus",
//       ),
//     ],
//   );

//   // Cart
//   static final CartModel cart = CartModel(
//     cartId: '001',
//     items: [
//       CartItemModel(
//         productId: '001',
//         variationId: '1',
//         quantity: 1,
//         title: products[0].title,
//         image: products[0].thumbnail,
//         brandName: products[0].brand!.name,
//         price: products[0].productVariations![0].price,
//         selectedVariation: products[0].productVariations![0].attributeValues,
//       ),
//       CartItemModel(
//         productId: '002',
//         variationId: '1',
//         quantity: 1,
//         title: products[1].title,
//         image: products[1].thumbnail,
//         brandName: products[1].brand!.name,
//         price: products[1].productVariations![0].price,
//         selectedVariation: products[1].productVariations![0].attributeValues,
//       ),
//     ],
//   );

//   // Order
//   static final List<OrderModel> oders = [
//     OrderModel(
//       id: "HZP0012",
//       status: OrderStatus.processing,
//       items: cart.items,
//       totalAmount: 960,
//       orderDate: DateTime(2023, 09, 1),
//       deliveryDate: DateTime(2023, 09, 9),
//     ),
//     OrderModel(
//       id: "HZP0013",
//       status: OrderStatus.shipped,
//       items: cart.items,
//       totalAmount: 960,
//       orderDate: DateTime(2023, 09, 1),
//       deliveryDate: DateTime(2023, 09, 9),
//     ),
//   ];

//   // List of all Categories
//   static final List<CategoryModel> categories = [
//     CategoryModel(
//         id: '1', name: "Sports", image: TImages.sportIcon, isFeatured: true),
//     CategoryModel(
//         id: '2',
//         name: "Furniture",
//         image: TImages.furnitureIcon,
//         isFeatured: true),
//     CategoryModel(
//         id: '3',
//         name: "Electronics",
//         image: TImages.electronicsIcon,
//         isFeatured: true),
//     CategoryModel(
//         id: '4', name: "Clothes", image: TImages.clothIcon, isFeatured: true),
//     CategoryModel(
//         id: '5', name: "Animals", image: TImages.animalIcon, isFeatured: true),
//     CategoryModel(
//         id: '6',
//         name: "Cosmetics",
//         image: TImages.cosmeticsIcon,
//         isFeatured: true),
//     CategoryModel(
//         id: '14',
//         name: "Jewelry",
//         image: TImages.jeweleryIcon,
//         isFeatured: true),

//     // Sub
//     CategoryModel(
//         id: '7',
//         name: "Sports Shoes",
//         image: TImages.sportIcon,
//         isFeatured: false),
//     CategoryModel(
//         id: '8',
//         name: "Track Suits",
//         image: TImages.sportIcon,
//         isFeatured: false),

//     CategoryModel(
//         id: '9',
//         name: "Sports Equipments",
//         image: TImages.sportIcon,
//         isFeatured: false),
//   ];
// }
