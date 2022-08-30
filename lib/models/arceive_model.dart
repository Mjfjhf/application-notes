class ArcheiveModel{
  String title;
  String discription;
  String id;

  ArcheiveModel({required this.title,required this.discription, this.id=''});

  Map<String,dynamic> tojson(ArcheiveModel archeiveModel){
    return {
      "title" : title,
      "discription" : discription,
      "id" : id,
    };
  }

  ArcheiveModel.fromJson(Map<String,dynamic> json) : this(
    title: json["title"] as String,
    discription: json["discription"] as String,
    id: json["id"] as String,
  );

}