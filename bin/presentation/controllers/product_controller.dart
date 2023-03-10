import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../../domain/dtos/product.dart';
import '../../domain/usecases/add_new_product.dart';
import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/find_one_product.dart';
import '../models/product_model.dart';

class ProductController {
  final GetAllProducts _getAllProducts;
  final FindOneProduct _findOneProduct;
  final AddNewProduct _addNewProduct;

  ProductController(this._getAllProducts, this._findOneProduct, this._addNewProduct);
  
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

    FutureOr<Response> findOne(Request request, String productID) async {
    try {
      final product = await _findOneProduct.perform(int.parse(productID));

      return Response.ok(jsonEncode({
        "product": ProductModel(id: product.id, name: product.name, tags: product.tags).toMap(),
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

  FutureOr<Response> createProduct(Request request) async {
    try {
      final String body = await request.readAsString();
      final Map<String, dynamic> newProduct = jsonDecode(body);
      final ProductDTO productDTO = ProductDTO.fromMap(newProduct);
      final product = await _addNewProduct.perform(productDTO);

      return Response.ok(jsonEncode({
        "product": ProductModel(id: product.id, name: product.name, tags: product.tags).toMap(),
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
