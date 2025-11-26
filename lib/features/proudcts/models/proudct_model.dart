class ProudctModel {
  String image;
  String title;
  num price;
  num rate;

  ProudctModel({
    required this.image,
    required this.title,
    required this.price,
    required this.rate,
  });
  factory ProudctModel.fromdata(Map<String, dynamic> json) {
    return ProudctModel(
      image: json['thumbnail'],
      title: json['title'],
      price: json['price'],
      rate: json['rating'],
    );
  }
}
