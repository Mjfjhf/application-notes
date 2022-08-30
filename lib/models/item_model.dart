import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel{
  String title;
  String discription;
  String id;

  ItemModel({required this.title,required this.discription, this.id=''});

  Map<String,dynamic> tojson(ItemModel itemModel){
    return {
      "title" : title,
      "discription" : discription,
      "id" : id,
    };
  }

  ItemModel.fromJson(Map<String,dynamic> json) : this(
    title: json["title"] as String,
    discription: json["discription"] as String,
    id: json["id"] as String,
  );

}