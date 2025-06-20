import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/scrrens/SplashScreen.dart';








void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
   await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey:"AIzaSyDO1CQmAzoED6rDD5JRG8PxmFs-68pxxmg" ,
     appId: "1:146502277756:web:c46a021eacc4f76310c7f9",
     messagingSenderId: "146502277756",
     projectId: "firwbase-web",
     storageBucket: "firwbase-web.appspot.com",

     )
   );
   
    
  }else{
    await Firebase.initializeApp(

   );
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      
        
        brightness: Brightness.dark,
       // primarySwatch: Colors.blue,
        useMaterial3: true,
        
      ),
      home:Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


