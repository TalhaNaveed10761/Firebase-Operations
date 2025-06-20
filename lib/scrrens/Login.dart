
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/scrrens/Databaseservices.dart';
import 'package:flutter_application_9/scrrens/Forgetpassword.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
   TextEditingController emailcontroller=TextEditingController();
   TextEditingController passwordcontroller=TextEditingController();
  @override
   final formkey=GlobalKey<FormState>();
  var height,width;
  Widget build(BuildContext context) {
      height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Logincreen",style: TextStyle(
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
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: () {
                
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => forgetpassword()),
        
        
      );
                }, child: Text("Forget Pasword",style: TextStyle(
                  fontSize: 20,
                ),)),
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
                 Databaseservices.Added(emailcontroller.text, passwordcontroller.text,context);
                }
               
                }, child: Text("Login")),
              )
            ],
          ),
        ),
    ));
  }
}