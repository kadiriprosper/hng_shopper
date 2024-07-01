import 'package:hng_shopper/mock/products_api.dart';
import 'package:hng_shopper/model/product_model.dart';

List<ProductModel> cartList = [];

List<ProductModel> allProducts = List.generate(
  MockProductApi.productList.length,
  (index) => ProductModel.fromMap(MockProductApi.productList[index]),
);
