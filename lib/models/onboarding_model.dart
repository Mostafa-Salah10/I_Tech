class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  new({required this.image, required this.title, required this.subTitle});

  static List<OnboardingModel> get onboardingData => [
    OnboardingModel(
      image: 'assets/images/Screenshot 2026-09-14 213159.png',
      title: "Find Trusted Doctors ",
      subTitle: "country to people bellief. lorem ipsum is not \n simply random text.it has roots in apiece of it \n over 2000 years old.",
    ),
    OnboardingModel(
      image: 'assets/images/Screenshot 2026-09-14 213159.png',
      title: "Find Trusted Doctors ",
      subTitle: "country to people bellief. lorem ipsum is not \n simply random text.it has roots in apiece of it \n over 2000 years old.",
    ),
    OnboardingModel(
      image: 'assets/images/Screenshot 2026-09-14 213159.png',
      title: "Find Trusted Doctors ",
      subTitle: "country to people bellief. lorem ipsum is not \n simply random text.it has roots in apiece of it \n over 2000 years old.",
    ),
  ];
}
