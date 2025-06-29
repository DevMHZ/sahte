class Services {
  final int id;
  final String name;
  final String price;
  final int nurseId;

  Services({
    required this.id,
    required this.name,
    required this.price,
    required this.nurseId,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,

      nurseId: json['nurse_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price, 'nurse_id': nurseId};
  }
}