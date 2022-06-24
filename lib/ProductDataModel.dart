
class ProductDataModel{
  int? index;
  String? name, about;

  ProductDataModel({required this.index, required this.name, required this.about});

  ProductDataModel.fromJson(Map<String, dynamic> json)
  {
    index = json['index'];
    name = json['name'];
    about = json['about'];
  }
}