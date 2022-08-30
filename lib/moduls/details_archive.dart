import 'package:flutter/material.dart';
import 'package:notes/home_layout/home.dart';
import 'package:notes/models/arceive_model.dart';
import 'package:notes/models/archeive/ArchivePage.dart';
import 'package:notes/models/item_model.dart';
import 'package:notes/utels/deal_with_firebase.dart';

import 'content_modal_edit.dart';

class DetailsArchive extends StatelessWidget {
  static const String routeName='details_archive';

  @override
  Widget build(BuildContext context) {
    var getItems= ModalRoute.of(context)?.settings.arguments as ArcheiveModel;
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
                 var item= ItemModel(title: getItems.title,discription: getItems.discription);
                  addNoteFirebasr(item);
                  deletArchive(getItems);
                  //Navigator.pushReplacementNamed(context, ArcheivePage.routeName);
                  Navigator.pop(context);
                },
                    icon:Icon(Icons.archive_outlined)),
                Spacer(),
                IconButton(onPressed: (){
                 deletArchive(getItems);
                  // Navigator.pushReplacementNamed(context,ArcheivePage.routeName);
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
