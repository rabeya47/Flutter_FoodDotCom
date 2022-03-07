




class Cart{
  int id;
  String productName;
  int quantity;
  double price;
  double total;

//<editor-fold desc="Data Methods">

  Cart({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.total,
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
          total == other.total);

  @override
  int get hashCode =>
      id.hashCode ^
      productName.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      total.hashCode;

  @override
  String toString() {
    return 'Cart{' +
        ' id: $id,' +
        ' productName: $productName,' +
        ' quantity: $quantity,' +
        ' price: $price,' +
        ' total: $total,' +
        '}';
  }

  Cart copyWith({
    int? id,
    String? productName,
    int? quantity,
    double? price,
    double? total,
  }) {
    return Cart(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'productName': this.productName,
      'quantity': this.quantity,
      'price': this.price,
      'total': this.total,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as int,
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      total: map['total'] as double,
    );
  }

//</editor-fold>
}