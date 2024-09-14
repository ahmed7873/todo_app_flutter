import 'package:api_app/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductVm {
  
  Future<List<ProductModel>?> getProducts() async {
    Dio dio = Dio();
    Response res = await dio.get("https://fakestoreapi.com/products");
    List<ProductModel>? products = res.data?.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
    return products;
  }
}
