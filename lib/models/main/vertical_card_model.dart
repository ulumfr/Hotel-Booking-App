class HotelVerticalCardPhoto {
  final String photo;

  HotelVerticalCardPhoto({
    required this.photo,
  });
}

List<HotelVerticalCardPhoto> nearbyHotels = [
  HotelVerticalCardPhoto(
    photo: 'assets/images/vertical1.jpg',
  ),
  HotelVerticalCardPhoto(
    photo: 'assets/images/vertical2.jpg',
  ),
  HotelVerticalCardPhoto(
    photo: 'assets/images/vertical3.jpg',
  ),
  HotelVerticalCardPhoto(
    photo: 'assets/images/vertical4.jpg',
  ),
];

class HotelVerticalCard {
  String name;
  String location;
  double price;
  double rating;

  HotelVerticalCard({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
  });

  factory HotelVerticalCard.fromMap(Map<String, dynamic> data) {
    return HotelVerticalCard(
      name: data["name"] ?? "",
      location: data["location"] ?? "",
      price: data["price"] != null ? double.parse(data["price"].toString()) : 0.0,
      rating: data["rating"] != null ? double.parse(data["rating"].toString()) : 0.0,
    );
  }
}

