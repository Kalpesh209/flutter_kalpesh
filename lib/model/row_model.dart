class RowModel {
  String? title;
  String? description;
  String? imageHref;

  RowModel({
    this.title,
    this.description,
    this.imageHref,
  });

  RowModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageHref = json['imageHref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['imageHref'] = this.imageHref;
    return data;
  }
}
