import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  
   TextEditingController emailcontroller=TextEditingController();
   final formkey=GlobalKey<FormState>();
   var height ,width;
   
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
               child: Container(
                    //height: height*0.1,
                    //width: width*0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                       
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
             ),
                SizedBox(
                  height: height*0.04,
                ),
                Container(
                  width: width*0.6,
                  height: height*0.07,
                  color: Colors.blue,
        
                  child: TextButton(onPressed: () async{
                  
                await  FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text).then((value){
                    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Message send to the email")),
          
        );
       
                  }).onError((error, stackTrace){
                  print("$error");
                  });
                 

      
                  
                 
                  }, child: Text("Sendpassword to the Email")),
                )
          ]
        ),
      ),
    );
  }
}