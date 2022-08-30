import 'package:flutter/material.dart';
import 'package:notes/models/item_model.dart';
import 'package:notes/utels/deal_with_firebase.dart';

class ContentModalEdit extends StatelessWidget {

  ItemModel itemModel;
  ContentModalEdit(this.itemModel);

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
                Text("Edit notes"),
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
             controller: TextEditingController(text: itemModel.title),
            maxLength: 12,
            onChanged: (text){
              itemModel.title=text;
            },
            decoration: InputDecoration(
              labelText: "Edit title",
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
            controller: TextEditingController(text: itemModel.discription),
            onChanged: (text){
              itemModel.discription=text;
            },
            maxLength: 500,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: "Edit description",
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
            updateNotes(itemModel);
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

              child: Text("Edit"))
        ],
      ),
    );
  }
}
