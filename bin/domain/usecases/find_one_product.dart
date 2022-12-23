import '../../data/interface_product_repository.dart';
import '../entities/product.dart';

class FindOneProduct {
  final IProductRepository repository;
  FindOneProduct(this.repository);

  Future<Product> perform(int productID) async {
    await Future.delayed(const Duration(microseconds: 50));
    final allProducts = repository.list().map((product) => 
     Product(id: product['id'] as int, name: product["name"] as String, tags: List<String>.from(product['tags'] as List<String>))).toList();
     
    final productsSelected = allProducts.firstWhere((item) => item.id == productID);

    return productsSelected;
  }
}