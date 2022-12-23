
import '../domain/dtos/product.dart';
import 'fake_data.dart';
import 'interface_product_repository.dart';

class ProductRepositoryInMemory implements IProductRepository {
  
  @override
  List<Map<String, dynamic>> list () {
    return products;
  }

  @override
  Map<String, dynamic> add(ProductDTO product) {
    products.add(product.toMap());
    return product.toMap();
  }
}