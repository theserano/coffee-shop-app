class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {
        required this.image, 
        required this.title, 
        required this.description
      });
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'lib/assets/image_1.png',
      title: 'Choose and customize your drinks with simplicity',
      description:
          "You want your drink and you want it your way so be bold and customize the way that makes you the happiest!"),
  OnboardingContent(
      image: 'lib/assets/image_2.png',
      title: 'No time to waste when you need your coffee',
      description:
          "We’ve crafted a quick and easy way for you to order your favorite coffee or treats thats fast!"),
  OnboardingContent(
      image: 'lib/assets/image_3.png',
      title: "Who doesn’t love rewards? We LOVE rewards!",
      description:
          "If you’re like us you love getting freebies and rewards! That’s why we have the best reward program in the coffee game!"),
];
