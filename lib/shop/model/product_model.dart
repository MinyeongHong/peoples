class Product {
  final int id;
  final String name;
  final String brand;
  final String? detail;
  final String imgUrl;
  final int price;
  final double? salePercent;
  final int salePrice;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.imgUrl,
    this.detail,
    this.salePercent,
    int? salePrice,
  }) : salePrice = salePrice ?? ((salePercent ?? 1.0) * price).toInt();
}

List<Product> mockProducts = [
  Product(
      id: 1,
      name: "카페 아메리카노 T",
      brand: "스타벅스",
      price: 5000,
      salePercent: 0.5,
      imgUrl: 'assets/images/image 27.png'),
  Product(
      id: 2,
      name: "이디야 5,000원 금액권",
      brand: "이디야커피",
      price: 5000,
      salePercent: 0.3,
      imgUrl: 'assets/images/image 30.png'),
  Product(
      id: 3,
      name: "카페 아메리카노 T",
      brand: "스타벅스",
      price: 10000,
      salePercent: 0.9,
      imgUrl: 'assets/images/image 27.png'),
  Product(
      id: 4,
      name: "이디야 5,000원 금액권",
      brand: "이디야커피",
      price: 5000,
      salePercent: 0.8,
      imgUrl: 'assets/images/image 30.png'),
];
