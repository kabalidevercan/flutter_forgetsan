class Things {
  String? id;
  String title;
  String? description;
  String? imgUrl;
  int isDone;
  DateTime dateTime;

  Things(
      {this.id,
      required this.title,
      this.description,
      this.imgUrl,
      this.isDone = 0,
      required this.dateTime});
}
