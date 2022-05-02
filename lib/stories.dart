// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_rest_api/models/news_data.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fectchData;
    return Scaffold(backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text('Details Page'),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.refresh))],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(child: Consumer<NewsData>(
          builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text(
                        'oops, something went wrong. $value.erroMessage',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        itemCount: value.map[ "data"].length,
                        itemBuilder: (context, index) {
                          return NewsCard(map: value.map["data"][index]);
                        },
                      );
          },
        )),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.map,
  }) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Image.network(
           map['avatar'].toString()
           ),
           SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: 
               [
                 Text('Name:' , style: TextStyle(fontWeight: FontWeight.bold)),
                 Text(
                 map["first_name"], style: TextStyle(fontWeight: FontWeight.bold),
               ),
                  SizedBox(width: 4,),
           Text(
             map["last_name"], style: TextStyle(fontWeight: FontWeight.bold),
           ),

             ],
           ),
         
             SizedBox(height: 2,),
           Text(
             map["email"], style: TextStyle(fontStyle: FontStyle.italic),
           ),
        ],
      ),
    );
  }
}
