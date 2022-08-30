import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/arceive_model.dart';
import 'package:notes/moduls/details_archive.dart';
import 'package:notes/utels/deal_with_firebase.dart';

import '../../moduls/category_widget.dart';

class ArcheivePage extends StatelessWidget {
 static const String routeName="archeive";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: Colors.green,
          title: Text("Archive",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<ArcheiveModel>>(
        stream: getDataArcheive(),
        builder: (context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snap.hasError){
            return Center(child: CircularProgressIndicator());
          }
          var listOfArcheive= snap.data!.docs??[];
          if(listOfArcheive.isEmpty){
            return Center(
                child: Text("No archeive notes !",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),));
          }else{
            return GridView.builder(
              itemCount: listOfArcheive.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8
              ), itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){

                  Navigator.pushNamed(context, DetailsArchive.routeName
                  ,arguments: listOfArcheive[index].data()
                  );
                },
                child: CategoryWidget(listOfArcheive[index].data().title,
                    listOfArcheive[index].data().discription,index
                ),
              );
            },);


          }
        },
      ),
    );
  }
}
