import 'package:playground/models/product.dart';
import 'package:playground/models/products_feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(id: '1', name: 'OutSide Ready', price: 30, image: "images/coilproduct10.jpeg",),
  Product(id: '2', name: 'Cool Windy Holder', price: 33, image: "images/coilproduct13.jpeg",),
  Product(id: '3', name: 'Sneaky Summer', price: 12, image: "images/coilproduct1.jpeg",),
  Product(id: '4', name: 'Sir Elegancy', price: 19, image: "images/coilproduct7.jpeg",),
  Product(id: '5', name: 'Push N Start', price: 35, image: "images/coilproduct2.jpeg",),
  Product(id: '6', name: 'StartShip', price: 32, image: "images/coilproduct9.jpeg",),
  Product(id: '7', name: 'Dramaticia', price: 21, image: "images/coilproduct24.jpg",),
  Product(id: '8', name: 'Life Savers', price: 29, image: "images/coilproduct3.jpeg",),
  Product(id: '9', name: 'All Szn', price: 9, image: "images/coilproduct20.jpeg",),
  Product(id: '10', name: 'High Fasho', price: 22, image: "images/coilproduct18.jpeg",),
  Product(id: '12', name: 'Why Not', price: 33, image: "images/coilproduct8.jpeg",),
  Product(id: '13', name: 'Open Szn', price: 29, image: "images/coilproduct11.jpeg",),
  Product(id: '14', name: 'Light Up', price: 19, image: "images/coilproduct4.jpeg",),
  Product(id: '15', name: 'Rainy Ship', price: 31, image: "images/coilproduct21.jpeg",),
  Product(id: '16', name: 'Anti-Not', price: 27, image: "images/coilproduct12.jpeg",),

];

const List<ProductsFeed> productFeed = [
  ProductsFeed(id: '1', image: "images/coilproduct11.jpeg"),
  ProductsFeed(id: '2', image: "images/coilproduct12.jpeg"),
  ProductsFeed(id: '3', image: "images/coilproduct8.jpeg"),
  ProductsFeed(id: '4', image: "images/coilproduct4.jpeg"),
  ProductsFeed(id: '5', image: "images/coilproduct20.jpeg"),
  ProductsFeed(id: '6', image: "images/coilproduct24.jpg"),
  ProductsFeed(id: '7', image: "images/coilproduct3.jpeg"),
  ProductsFeed(id: '8', image: "images/coilproduct1.jpeg"),
  ProductsFeed(id: '9', image: "images/coilproduct13.jpeg"),
  ProductsFeed(id: '10', image: "images/coilproduct7.jpeg")

  

];

@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<ProductsFeed> productfeed(ref) {
  return productFeed;
}