

import 'package:flutter/material.dart';
import 'package:flutter_application_9/scrrens/Databaseservices.dart';




class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _authscreenState();
}
 
  TextEditingController emailcontroller=TextEditingController();
   TextEditingController passwordcontroller=TextEditingController();
   TextEditingController namecontroller=TextEditingController();

   

class _authscreenState extends State<Signup> {
  @override
  void dispose() {
    namecontroller.dispose();
  emailcontroller.dispose();
  passwordcontroller.dispose();
    super.dispose();
  }
  final formkey=GlobalKey<FormState>();
  var height,width;
  @override
  Widget build(BuildContext context) {
     height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Signupscreen",style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        ),
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //height: height*0.1,
                //width: width*0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter the Field";
                      }
                      return null;
                    },
                   controller: namecontroller,
                   decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     )
                   ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.04,
              ),
             
          
               Container(
                //height: height*0.1,
                //width: width*0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter the Field";
                      }
                      return null;
                    },
                   controller: emailcontroller,
                   decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     )
                   ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.04,
              ),
               Container(
               // height: height*0.1,
               // width: width*0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter the Field";
                      }
                      return null;
                    },
                   controller: passwordcontroller,
                   decoration: InputDecoration(
                    hintText: "passwoed",
                    labelText: "password",
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     )
                   ),
                  ),
                ),
              ),
              
               SizedBox(
                height: height*0.04,
              ),
              Container(
                width: width*0.6,
                height: height*0.07,
                color: Colors.blue,

                child: TextButton(onPressed: () {
                if(formkey.currentState!.validate()){
                  Databaseservices.AuthData(emailcontroller.text, passwordcontroller.text, context);
                }
               
                }, child: Text("Signup")),
              )
            ],
          ),
        ),
      ),
    );
  }
}