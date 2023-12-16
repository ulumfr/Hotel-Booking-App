class OnBoardingContent {
  final String image1;
  final String image2;
  final String text;
  final String dsc;

  OnBoardingContent({
    required this.image1,
    required this.image2,
    required this.text,
    required this.dsc,
  });

  factory OnBoardingContent.fromMap(Map<String, dynamic> data) {
    return OnBoardingContent(
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      text: data['text'] ?? '',
      dsc: data['dsc'] ?? '',
    );
  }
}
