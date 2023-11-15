class HotelHorizontalCard {
  String name;
  String location;
  double price;
  double rating;
  String photo;

  HotelHorizontalCard({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.photo,
  });

  factory HotelHorizontalCard.fromMap(Map<String, dynamic> data) {
    return HotelHorizontalCard(
      name: data["name"] ?? "",
      location: data["location"] ?? "",
      price: data["price"] != null ? double.parse(data["price"].toString()) : 0.0,
      rating: data["rating"] != null ? double.parse(data["rating"].toString()) : 0.0,
      photo: data["photo"] ?? "",
    );
  }
}