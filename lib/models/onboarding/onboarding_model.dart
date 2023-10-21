class OnBoardingContent {
  String image1;
  String image2;
  String text;
  String dsc;

  OnBoardingContent({
    required this.image1,
    required this.image2,
    required this.text,
    required this.dsc,
  });
}

List<OnBoardingContent> geser = [
  OnBoardingContent(
    text: "Fast Respond",
    image1: 'assets/images/view.jpg',
    image2: 'assets/images/view2.jpg',
    dsc: 'Experience the ease of fast and efficient hotel booking with our service',
  ),
  OnBoardingContent(
    text: "The Best Hotels For you",
    image1: 'assets/images/view3.jpg',
    image2: 'assets/images/view4.jpg',
    dsc: 'Find best hotels for you vocation and get it right now',
  ),
  OnBoardingContent(
    text: "Book Now, Stay Immediately",
    image1: 'assets/images/view5.jpg',
    image2: 'assets/images/view6.jpg',
    dsc: 'Enjoy a fast and easy hotel booking experience with us',
  )
];
