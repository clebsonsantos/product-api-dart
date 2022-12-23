import '../../data/interface_product_repository.dart';
import '../entities/product.dart';

class GetAllProducts {
  final IProductRepository repository;
  GetAllProducts(this.repository);

  Future<List<Product>> perform() async {
    await Future.delayed(const Duration(microseconds: 50));
    final products = repository.list().map((product) => Product(id: product['id'], name: product["name"], tags: product["tags"])).toList();
    return products;
  }
}