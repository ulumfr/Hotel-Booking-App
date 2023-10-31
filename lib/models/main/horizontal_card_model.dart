class HotelHorizontalCard {
  final String name;
  final String location;
  final String photo;
  final String price;
  final double rating;

  HotelHorizontalCard({
    required this.name,
    required this.location,
    required this.photo,
    required this.price,
    required this.rating,
  });
}

List<HotelHorizontalCard> popularHotels = [
  HotelHorizontalCard(
    name: 'Sheraton Montazah Hotel',
    location: 'Alexandra, Egypt',
    photo: 'assets/images/kamar1.jpg',
    price: '100',
    rating: 4.0,
  ),
  HotelHorizontalCard(
    name: 'Rayz UMM Hotel Malang',
    location: 'Malang, Indonesia',
    photo: 'assets/images/kamar2.jpg',
    price: '100',
    rating: 4.0,
  ),
];
