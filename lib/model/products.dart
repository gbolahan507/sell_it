class Products {
  String productName;
  String price;
  String description;
  String id;
  String image;
  List category;

  Products({
    this.id,
    this.image,
    this.productName,
    this.price,
    this.description,
    this.category,
  });

  Products.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    productName = data['productName'];
    price = data['price'];
    description = data['description'];
    category = data['category'];
    image = data['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }
}
