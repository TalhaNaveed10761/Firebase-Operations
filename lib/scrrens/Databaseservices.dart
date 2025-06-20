

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_9/scrrens/Login.dart';
import 'package:flutter_application_9/scrrens/notesApp.dart';

class Databaseservices{
  
  static Future<void>AuthData(String email,String password,BuildContext context)async{
  try{
   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
        
        
      );
     print("Signup");




  }on FirebaseAuthException catch (e){
    print(e.toString());
  }
     
      
     }
      static Future<void>Added(String email,String password ,BuildContext context)async{
  try{
   FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotesApp()),
        
        
      );
   
     print("Login");




  }on FirebaseAuthException catch (e){
    print(e.toString());
  }
     
      
     }
  }

