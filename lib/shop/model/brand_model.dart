class Brand {
  final int id;
  final String name;
  final String url;

  Brand({required this.id, required this.name, required this.url});
}

List<Brand> mockBrands = [
  Brand(id: 1, name: "빽다방", url: "assets/images/bback.png"),
  Brand(id: 2, name: "스타벅스", url: "assets/images/starbucks.png"),
  Brand(id: 3, name: "엔제리너스", url: "assets/images/angel.png"),
  Brand(id: 4, name: "이디야커피", url: "assets/images/ediya.png"),
];
