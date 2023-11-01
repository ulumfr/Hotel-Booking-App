// class HotelVerticalCard {
//   final String name;
//   final String location;
//   final String photo;
//   final String price;
//   final double rating;

//   HotelVerticalCard({
//     required this.name,
//     required this.location,
//     required this.photo,
//     required this.price,
//     required this.rating,
//   });
// }

// List<HotelVerticalCard> nearbyHotels = [
//   HotelVerticalCard(
//     name: 'The Nile Ritz-Carlton, Cairo',
//     location: 'Cairo',
//     photo: 'assets/images/kamar3.jpg',
//     price: '110',
//     rating: 5.0,
//   ),
//   HotelVerticalCard(
//     name: 'Manhattan Hotel Jakarta',
//     location: 'Indonesia',
//     photo: 'assets/images/view3.jpg',
//     price: '100',
//     rating: 4.0,
//   ),
// ];

class HotelVerticalCardPhoto {
  final String photo;

  HotelVerticalCardPhoto({
    required this.photo,
  });
}

List<HotelVerticalCardPhoto> nearbyHotels = [
  HotelVerticalCardPhoto(
    photo: 'assets/images/lobby.jpg',
  ),
  HotelVerticalCardPhoto(
    photo: 'assets/images/view3.jpg',
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

