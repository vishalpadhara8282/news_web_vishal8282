class UploadRequest {
  String category;
  String image;
  int groupValue;
  String title;
  String description;
  String longDescription;
  String date;
  String dateShow;
  String time;
  List<String> imageList = [];


  UploadRequest(
      {this.category,
        this.image,
        this.groupValue,
        this.title,
        this.description,this.longDescription,
        this.date,this.dateShow,
        this.time,
        this.imageList
      });

  UploadRequest.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    image = json['image'];
    groupValue = json['groupValue'];
    title = json['title'];
    description = json['description'];
    longDescription = json['longDescription'];
    date = json['date'];
    dateShow = json['dateShow'];
    time = json['time'];
    imageList = json['imageList'].cast<String>();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['image'] = this.image;
    data['groupValue'] = this.groupValue;
    data['title'] = this.title;
    data['description'] = this.description;
    data['longDescription'] = this.longDescription;
    data['date'] = this.date;
    data['dateShow'] = this.dateShow;
    data['time'] = this.time;
    data['imageList'] = this.imageList;

    return data;
  }
}
