




class Cart{
  int id;
  String productName;
  int quantity;
  double price;
  String imageUri;

//<editor-fold desc="Data Methods">

  Cart({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.imageUri,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          productName == other.productName &&
          quantity == other.quantity &&
          price == other.price &&
          imageUri == other.imageUri);

  @override
  int get hashCode =>
      id.hashCode ^
      productName.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      imageUri.hashCode;

  @override
  String toString() {
    return 'Cart{' +
        ' id: $id,' +
        ' productName: $productName,' +
        ' quantity: $quantity,' +
        ' price: $price,' +
        ' imageUri: $imageUri,' +
        '}';
  }

  Cart copyWith({
    int? id,
    String? productName,
    int? quantity,
    double? price,
    String? imageUri,
  }) {
    return Cart(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUri: imageUri ?? this.imageUri,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'productName': this.productName,
      'quantity': this.quantity,
      'price': this.price,
      'imageUri': this.imageUri,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as int,
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      imageUri: map['imageUri'] as String,
    );
  }

//</editor-fold>
}