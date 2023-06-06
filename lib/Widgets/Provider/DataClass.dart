import 'package:flutter/cupertino.dart';
import 'DataModel.dart';
import 'Service_class.dart';

class DataClass extends ChangeNotifier{
  DataModel? post;
  bool loading = false;

  getPostData() async{
    loading = true;
    post = (await getSinglePostData());
    loading = false;

    notifyListeners();
  }

}