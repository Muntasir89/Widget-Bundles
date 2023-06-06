import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'DataModel.dart';

Future<DataModel?> getSinglePostData() async{
  DataModel? result;
  try{
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/2"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },);
    if(response.statusCode == 200){
      final item = json.decode(response.body);
      result = DataModel.fromJson(item);
    }else{
      print('Error');
    }
  }catch(e){
  }
  return result;
} 