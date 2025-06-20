import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_9/scrrens/Edit.dart';
import 'package:flutter_application_9/scrrens/Firebaseservices.dart';

class Fetchdata extends StatefulWidget {
  String ?title;
  String ?detail;
   Fetchdata({super.key,this.title,this.detail});

  @override
  State<Fetchdata> createState() => _FetchdataState();
}

class _FetchdataState extends State<Fetchdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("notes").snapshots(),
       builder: (context, snapshot) {
        if(snapshot.hasData)
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder:
           (context,int index) {
          final res=snapshot.data!.docs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                Firebaseservices.deletedata(res.id);
              },
              child: Card(child: ExpansionTile(title:Text("title: ${res['title']}"),
              subtitle: Text("detail: ${res['detail']}"),
              leading: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(
                  id:res.id,
                  title: res['title'],
                  detail: res['detail'],
                ),));
              }, icon: Icon(Icons.edit)),
               ),
               
              
              ),
            ),
          );
          
          },
          
          );
          else{
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            );
          }
        
         
       },
       ),
    );
  }
}