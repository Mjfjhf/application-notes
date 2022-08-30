import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/archeive/ArchivePage.dart';
import 'package:notes/moduls/details_archive.dart';
import 'package:notes/moduls/details_item.dart';

import 'home_layout/home.dart';


main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routName: (context) => HomePage(),
        Details.routeName :(context) => Details(),
        ArcheivePage.routeName : (context) => ArcheivePage(),
        DetailsArchive.routeName :(context) => DetailsArchive()
      },
      initialRoute: HomePage.routName,
    );
  }
}
