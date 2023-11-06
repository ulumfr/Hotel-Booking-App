class HotelHorizontalCardPhoto {
  final String photo;

  HotelHorizontalCardPhoto({
    required this.photo,
  });
}

List<HotelHorizontalCardPhoto> popularHotels = [
  HotelHorizontalCardPhoto(
    photo: 'assets/images/kamar3.jpg',
  ),
  HotelHorizontalCardPhoto(
    photo: 'assets/images/kamar2.jpg',
  ),
  HotelHorizontalCardPhoto(
    photo: 'assets/images/kamar1.jpg',
  ),
  HotelHorizontalCardPhoto(
    photo: 'assets/images/view7.jpg',
  ),
];

class HotelHorizontalCard {
  String name;
  String location;
  double price;
  double rating;

  HotelHorizontalCard({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
  });

  factory HotelHorizontalCard.fromMap(Map<String, dynamic> data) {
    return HotelHorizontalCard(
      name: data["name"] ?? "",
      location: data["location"] ?? "",
      price: data["price"] != null ? double.parse(data["price"].toString()) : 0.0,
      rating: data["rating"] != null ? double.parse(data["rating"].toString()) : 0.0,
    );
  }
}
