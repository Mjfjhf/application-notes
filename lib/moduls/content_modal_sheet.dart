import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/item_model.dart';
import 'package:notes/utels/deal_with_firebase.dart';

class ContentModal extends StatelessWidget {
 String title='';
 String descrip='';
 String titleedi;
 String description;
 String header;

 ContentModal(this.titleedi, this.description, this.header);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: MediaQuery.of(context).size.height *.46,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height *.03,
            child: Row(
              children: [
                Text(header),
                Spacer(),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close_rounded))
              ],
            ),
          ),
          SizedBox(height: 7,),
          TextField(
            maxLength: 12,
            onChanged: (text){
              title=text;
            },
            decoration: InputDecoration(
              labelText: titleedi,
              fillColor: Colors.black12,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              ),
            ),
            autofocus: true,
          ),
          SizedBox(height: 17,),
          TextField(
            onChanged: (text){
              descrip=text;
            },
            maxLength: 500,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: description,
              fillColor: Colors.black12,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              ),
            ),
            autofocus: true,
          ),
          //SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            //add to fire base
            ItemModel itemModel=ItemModel(title: title,discription: descrip);
            addNoteFirebasr(itemModel);
            Navigator.pop(context);
          },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                )
              ) ,
              child: Text("add"))
        ],
      ),
    );
  }
}
