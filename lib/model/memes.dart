
class UploadMemes {
  String image;
  String date;
  String time;

  UploadMemes(
      {
        this.image,
        this.date,
        this.time});

  UploadMemes.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
