import '../../data/interface_product_repository.dart';
import '../entities/product.dart';

class GetAllProducts {
  final IProductRepository repository;
  GetAllProducts(this.repository);

  Future<List<Product>> perform() async {
    await Future.delayed(const Duration(microseconds: 50));
    final products = repository.list().map((product) => 
     Product(id: product['id'] as int, name: product["name"] as String, tags: List<String>.from(product['tags'] as List<String>))).toList();
    return products;
  }
}