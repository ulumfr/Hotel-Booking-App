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

List<Hotel> nearbyHotels = [
  Hotel(
    name: 'The Nile Ritz-Carlton, Cairo',
    location: 'Cairo',
    photo: 'assets/images/kamar3.jpg',
    price: '110',
    rating: 5.0,
  ),
  Hotel(
    name: 'Manhattan Hotel Jakarta',
    location: 'Indonesia',
    photo: 'assets/images/view3.jpg',
    price: '100',
    rating: 4.0,
  ),
];
