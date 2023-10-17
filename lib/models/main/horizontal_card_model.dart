class Hotel {
  final String name;
  final String location;
  final String photo;
  final String price;
  final double rating;

  Hotel({
    required this.name,
    required this.location,
    required this.photo,
    required this.price,
    required this.rating,
  });
}

List<Hotel> popularHotels = [
  Hotel(
    name: 'Sheraton Montazah Hotel',
    location: 'Alexandra, Egypt',
    photo: 'assets/images/kamar1.jpg',
    price: '100',
    rating: 4.0,
  ),
  Hotel(
    name: 'Gatau Dimana',
    location: 'Indonesia',
    photo: 'assets/images/kamar2.jpg',
    price: '100',
    rating: 4.0,
  ),
];
