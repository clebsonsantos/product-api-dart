import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'data/product_repository.dart';
import 'domain/usecases/add_new_product.dart';
import 'domain/usecases/find_one_product.dart';
import 'domain/usecases/get_all_products.dart';
import 'presentation/controllers/product_controller.dart';

Future<void> bootstrap(Router router) async {
  final ProductRepositoryInMemory repository = ProductRepositoryInMemory();
  final GetAllProducts getAllProducts = GetAllProducts(repository);
  final FindOneProduct findOneProduct = FindOneProduct(repository);
  final AddNewProduct addNewProduct = AddNewProduct(repository);
  final ProductController productController = ProductController(getAllProducts, findOneProduct, addNewProduct);

  router.get("/products", productController.getAll);
  router.get("/products/<productID>", productController.findOne);
  router.post("/products/create", productController.createProduct);

  final ip = InternetAddress.anyIPv4;

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}