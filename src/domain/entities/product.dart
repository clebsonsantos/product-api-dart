class Product {
  final int id;
  final String name;
  final List<String> tags;

  Product({
    required this.id,
    required this.name,
    required this.tags,
  });

  get value { 
    return this;
  }
}
