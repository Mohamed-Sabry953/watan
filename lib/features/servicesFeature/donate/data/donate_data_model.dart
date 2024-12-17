class DonateDataModel {
  String title;
  String mainContent;
  String image;
  String address;
  String link;
  String phoneNumber;
  List<String>? images;
  String details;

  DonateDataModel(
      {required this.title,
      required this.mainContent,
      required this.image,
      required this.address,
      required this.link,
      required this.phoneNumber,
      this.images,
      required this.details});
}
