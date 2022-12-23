import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../../domain/usecases/get_all_products.dart';
import '../models/product_model.dart';

class ProductController {
  final GetAllProducts _getAllProducts;

  ProductController(this._getAllProducts);
  
  FutureOr<Response> getAll(Request request) async {
    try {
      final products = await _getAllProducts.perform();
      return Response.ok(jsonEncode({
        "products": products.map((item) => ProductModel(id: item.id, name: item.name, tags: item.tags).toMap()).toList(),
      }) , headers: {
        HttpHeaders.contentTypeHeader: "application/json"
      });
    } catch (e) {
      print(e.toString());
      return Response.internalServerError(
        body: jsonEncode({
        "error": e.toString()
      }),
      );
    }
  }
}
