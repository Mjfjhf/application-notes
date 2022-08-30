import 'package:flutter/material.dart';
import 'package:notes/moduls/content_body.dart';
import 'package:notes/moduls/content_modal_sheet.dart';

import '../models/archeive/ArchivePage.dart';

class HomePage extends StatelessWidget {
static const String routName="home_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, ArcheivePage.routeName);
            },
                icon: Icon(Icons.archive_outlined))
          ],
          centerTitle: true,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          title: Text("youre notes"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,
              builder: (context){
            return ContentModal("add new notes","add description","add new notes");
              },isScrollControlled: true);
        },
        child: Icon(Icons.add),
      ),
      body: ContentBody(),
    );
  }
}
