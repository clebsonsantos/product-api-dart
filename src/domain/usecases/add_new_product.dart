import '../../data/interface_product_repository.dart';
import '../dtos/product.dart';
import '../entities/product.dart';

class AddNewProduct {
  final IProductRepository repository;
  AddNewProduct(this.repository);

  Future<Product> perform(ProductDTO product) async {
    await Future.delayed(const Duration(microseconds: 50));
    product = product.copyWith(id: 23242);
    final productsSelected = repository.add(product);

    return  Product(id: productsSelected['id'] as int, name: productsSelected["name"] as String, tags: List<String>.from(productsSelected['tags'] as List<String>));
  }
}