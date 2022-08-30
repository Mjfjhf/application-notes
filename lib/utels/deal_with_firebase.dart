import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/arceive_model.dart';
import 'package:notes/models/item_model.dart';
CollectionReference<ItemModel> senData(){
  return  FirebaseFirestore.instance.collection("notes").withConverter<ItemModel>(
      fromFirestore: (snap,doc){
        return ItemModel.fromJson(snap.data()!);
      },
      toFirestore: (item,obt)=>item.tojson(item));
}
CollectionReference<ArcheiveModel> senDataArceve(){
  return  FirebaseFirestore.instance.collection("archeive").withConverter<ArcheiveModel>(
      fromFirestore: (snap,doc){
        return ArcheiveModel.fromJson(snap.data()!);
      },
      toFirestore: (archev,obt)=>archev.tojson(archev));
}

 Future<void> addNoteFirebasr(ItemModel itemModel){
 var collection=senData();
 var doc=collection.doc();
 itemModel.id=doc.id;
 return doc.set(itemModel);
}

Stream<QuerySnapshot<ItemModel>> getData(){
  var collection = senData();
  return collection.snapshots();
}

void updateNotes(ItemModel itemModel){
  var collection= senData();
   collection.doc(itemModel.id).update(itemModel.tojson(itemModel));
}

void deletData(ItemModel itemModel){
  var collection=senData();
  collection.doc(itemModel.id).delete();
}

Future<void> addToArcheive(ArcheiveModel archeiveModel){
  var collection= senDataArceve();
  var doc=collection.doc();
  archeiveModel.id=doc.id;
  return doc.set(archeiveModel);
}

Stream<QuerySnapshot<ArcheiveModel>> getDataArcheive(){
  var collrction= senDataArceve();
  return collrction.snapshots();
}
 void deletArchive(ArcheiveModel archeiveModel){
  var collection = senDataArceve();
  collection.doc(archeiveModel.id).delete();
 }