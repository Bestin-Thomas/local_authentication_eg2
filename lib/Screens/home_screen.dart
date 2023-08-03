import 'package:flutter/material.dart';
import 'package:local_authentication/services/local_auth_services.dart';

 class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

   @override
   State<HomeScreen> createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {
   bool authenticated=false;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Face Id example"),
         centerTitle: true,
       ),
       body: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(
                 onPressed: () async{
                   final authenticate=await LocalAuth.authenticate();
                   setState(() {
                     authenticated=authenticate;
                   });
                 },
                 child: Text("Authenticate"),
             ),
             if(authenticated)
               const Text('You are Authenticated'),
             if(authenticated)
               ElevatedButton(
                   onPressed: (){
                     setState(() {
                       authenticated=false;
                     });
                   },
                   child: Text("Log Out"),
               )
           ],
         ),
       ),
     );
   }
 }
