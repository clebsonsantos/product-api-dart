import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import '../src/domain/usecases/get_all_products.dart';
import '../src/data/product_repository.dart';
import '../src/presentation/controllers/product_controller.dart';


final _router = Router();

void main(List<String> args) async {
  final ProductRepositoryInMemory repository = ProductRepositoryInMemory();
  final GetAllProducts getAllProducts = GetAllProducts(repository);
  final ProductController productController = ProductController(getAllProducts);

  _router.get("/products", productController.getAll);

  final ip = InternetAddress.anyIPv4;

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
