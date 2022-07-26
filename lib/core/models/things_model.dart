class Things {
  String? id;
  String title;
  String? description;
  String? imgUrl;
  int isLooked;
  DateTime dateTime;

  Things(
      {this.id,
      required this.title,
      this.description,
      this.imgUrl,
      this.isLooked = 0,
      required this.dateTime});
}
