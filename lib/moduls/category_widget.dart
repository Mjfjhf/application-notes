import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/moduls/content_body.dart';

class CategoryWidget extends StatelessWidget {
    String title;
    String descrip;
    int index;
    CategoryWidget(this.title, this.descrip,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height *.1,
      width: MediaQuery.of(context).size.width *.1,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(index%2==0 ?0:20),
          bottomLeft: Radius.circular(index%2!=0 ?0:20),
        )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(title,style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),),
            Text(descrip,style: TextStyle(
              color: Colors.green
            ),),
          ],
        ),
      ),
    );
  }
}
