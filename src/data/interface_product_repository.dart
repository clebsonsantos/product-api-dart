import '../domain/dtos/product.dart';

abstract class IProductRepository {
  List<Map<String, dynamic>> list();
  Map<String, dynamic> add(ProductDTO product);
}