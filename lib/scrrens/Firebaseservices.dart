import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_9/scrrens/fetchdata.dart';

class Firebaseservices{


  static Future<void>adddata(BuildContext context,String title,String detail)async{
    await FirebaseFirestore.instance.collection("notes").add({
      "title":title,
      "detail":detail,

    }).whenComplete(() {
      print('Data is added');
        Navigator.push(context, MaterialPageRoute(builder: (context) => Fetchdata(
          title: title,
          detail: detail,
         
        ),));
    }).catchError((e){
print(e.toString());
    });

  }
  static Future<void>deletedata(String id)async{
await FirebaseFirestore.instance.collection("notes").doc(id).delete();
  }
  static Future<void>updatedata(String id,String title,String detail)async{
    await FirebaseFirestore.instance.collection("notes").doc(id).update({
   "title":title,
      "detail":detail,
    });

  }
}