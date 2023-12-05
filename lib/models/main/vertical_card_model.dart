class HotelVerticalCard {
  String name;
  String location;
  int price;
  double rating;
  String photo;

  HotelVerticalCard({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.photo,
  });

  factory HotelVerticalCard.fromJson(Map<String, dynamic> data) {
    return HotelVerticalCard(
      name: data["name"] as String,
      location: data["location"] as String,
      price: data["price"] ?? "",
      rating: data["rating"]?.toDouble() ?? 0.0,
      photo: data["photo"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'price': price,
      'rating': rating,
      'photo': photo,
    };
  }
}

// class HotelVerticalCard {
//   String name;
//   String location;
//   int price;
//   double rating;
//   String photo;

//   HotelVerticalCard({
//     required this.name,
//     required this.location,
//     required this.price,
//     required this.rating,
//     required this.photo,
//   });

//   factory HotelVerticalCard.fromMap(Map<String, dynamic> data) {
//     return HotelVerticalCard(
//       name: data["name"] ?? "",
//       location: data["location"] ?? "",
//       price: data["price"] ?? "",
//       rating: data["rating"] != null ? double.parse(data["rating"].toString()) : 0.0,
//       photo: data["photo"] ?? "",
//     );
//   }
// }