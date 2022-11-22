class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: 'Bem Vindo(a) ao ViSh',
      image: 'assets/images/onboarding_01.png',
      discription:
          "O Shopping Virtual como você nunca viu. No ViSh, você poderá ter sempre o necessário no conforto da sua casa."),
  OnbordingContent(
      title: '',
      image: 'assets/images/onboarding_02.png',
      discription:
          "Com a ViSh, parecerá que você está morando novamente com os seus pais. Você não vai mais precisar se preocupar com as compras da casa."),
  OnbordingContent(
      title: '',
      image: 'assets/images/onboarding_03.png',
      discription:
          "Parece mágica, mas não é! Com o seu histórico de consumo podemos agendar e afetuar compras de forma automática. Você terá o que quer sempre que precisar."),
  OnbordingContent(
      title: '',
      image: 'assets/images/onboarding_04.png',
      discription: "Tudo que precisa, sem você nem perceber..."),
];
