
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_9/scrrens/Firebaseservices.dart';


class Edit extends StatefulWidget {
  String?id;
  String?title;
  String?detail;
   Edit({super.key,this.id,this.title,this.detail});

  @override
  State<Edit> createState() => _loginState();
}

class _loginState extends State<Edit> {
   TextEditingController titlecontroller=TextEditingController();
   TextEditingController detailcontroller=TextEditingController();
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
        title: const Text("Update",style: TextStyle(
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
                   controller: titlecontroller,
                   decoration: InputDecoration(
                   
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
                    minLines: 1,
                    maxLines: 5,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Enter the Field";
                      }
                      return null;
                    },
                   controller: detailcontroller,
                   decoration: InputDecoration(
                  
              
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     )
                   ),
                  ),
                ),
              ),SizedBox(
                height: height*0.05,
              ),
            
              Container(
                width: width*0.6,
                height: height*0.07,
                color: Colors.blue,

                child: TextButton(onPressed: () {
                if(formkey.currentState!.validate()){
                 Firebaseservices.updatedata(widget.id!, titlecontroller.text, detailcontroller.text);
                }
               
                }, child: Text("Update")),
              )
            ],
          ),
        ),
    ));
  }
}