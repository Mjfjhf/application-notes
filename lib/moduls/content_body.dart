import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/item_model.dart';
import 'package:notes/moduls/category_widget.dart';
import 'package:notes/moduls/details_item.dart';
import 'package:notes/utels/deal_with_firebase.dart';

class ContentBody extends StatelessWidget {
  static const String routeName='page';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<ItemModel>>(
        stream: getData(),
        builder: (context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snap.hasError){
            return Center(child: CircularProgressIndicator());
          }
          var listOfnots= snap.data!.docs??[];
          if(listOfnots.isEmpty){
            return Center(child: Text("No notes ! ",style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),));
          }else{
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7
              ),
              itemCount: listOfnots.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Details.routeName,
                        arguments: listOfnots[index].data());
                    print(index);
                  },
                  child: CategoryWidget(listOfnots[index].data().title,
                      listOfnots[index].data().discription,index),
                );
              },);
          }

        });
  }
}
