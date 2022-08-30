import 'package:flutter/material.dart';
import 'package:notes/home_layout/home.dart';
import 'package:notes/models/arceive_model.dart';
import 'package:notes/models/archeive/ArchivePage.dart';
import 'package:notes/models/item_model.dart';
import 'package:notes/moduls/content_modal_sheet.dart';
import 'package:notes/moduls/details_archive.dart';
import 'package:notes/utels/deal_with_firebase.dart';

import 'content_modal_edit.dart';

class Details extends StatelessWidget {
  static const String routeName='details';

  @override
  Widget build(BuildContext context) {
    var getItems= ModalRoute.of(context)?.settings.arguments as ItemModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(getItems.title,style: TextStyle(
          fontSize: 28
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black54,
            height: MediaQuery.of(context).size.height *0.07,
            child: Row(
              children: [
                IconButton(onPressed: (){
                  showModalBottomSheet(context: context,
                      builder:(context){
                    return ContentModalEdit(getItems);
                      },isScrollControlled: true);
                },
                    icon: Icon(Icons.update)),
                IconButton(onPressed: (){
                  ArcheiveModel archeive=ArcheiveModel(title: getItems.title,
                      discription: getItems.discription);
                  addToArcheive(archeive);
                  deletData(getItems);
                  //Navigator.pushReplacementNamed(context, HomePage.routName);
                  Navigator.pop(context);
                  print(archeive);
                },
                    icon: Icon(Icons.archive_outlined)),//no archive
                Spacer(),
                IconButton(onPressed: (){
                  deletData(getItems);
                  //Navigator.pushReplacementNamed(context, HomePage.routName,);
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.delete)),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Text(getItems.discription))
        ],
      ),

    );
  }
}
