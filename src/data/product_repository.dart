
import 'fake_data.dart';
import 'interface_product_repository.dart';

class ProductRepositoryInMemory implements IProductRepository {
  
  @override
  List<Map<String, dynamic>> list () {
    return products;
  }
}