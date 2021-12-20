import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id, name, city, imageUrl;
  final double rating;
  final int price;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'],
      city: json['city'],
      imageUrl: json['imageUrl'],
      rating: double.parse(json['rating'].toString()),
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'rating': rating,
        'price': price,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [id, name, city, imageUrl, rating, price];
}
