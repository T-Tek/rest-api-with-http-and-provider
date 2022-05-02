// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_rest_api/models/news_data.dart';
import 'package:provider_rest_api/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.purple,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NewsData(),
        builder: (context, child) {
          return StoriesPage();
        }
        ),
    );
  }
}

