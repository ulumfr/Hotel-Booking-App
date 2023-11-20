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

  factory HotelVerticalCard.fromMap(Map<String, dynamic> data) {
    return HotelVerticalCard(
      name: data["name"] ?? "",
      location: data["location"] ?? "",
      price: data["price"] ?? "",
      rating: data["rating"] != null ? double.parse(data["rating"].toString()) : 0.0,
      photo: data["photo"] ?? "",
    );
  }
}