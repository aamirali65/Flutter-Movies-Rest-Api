import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api/services/api_fetch.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _myAppState();
}

class _myAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(future: Api.fetchApi(), builder: (context,snapshot){
          if(ConnectionState.waiting == snapshot.connectionState){
            return const Center(child: CircularProgressIndicator());
          };
          if(snapshot.hasData){
            Map map1 = jsonDecode(snapshot.data);
            List data = map1['tv_shows'];
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${data[index]['image_thumbnail_path']}'),
                        fit: BoxFit.fill
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${data[index]['name']}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w300,color: Colors.white),),
                        Text('${data[index]['network']}',style: const TextStyle(fontSize: 18,color: Colors.white))
                      ],
                    ),
                  );
                });
          }
          return Container();
        }),
      ),
    );
  }
}

