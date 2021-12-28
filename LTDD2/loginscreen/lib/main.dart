import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/widgets/cardCity.dart';

import 'widgets/UserCard.dart';

void main() {
  runApp(const MyApp());
}

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ignore: avoid_unnecessary_ontainercontainers
      body:
      GridView.count(

        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: const <Widget>[
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
          CardCity(),
        ],
      )



        // ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 10,
        //     itemBuilder: (context, index){
        //       if(index % 2 == 0){
        //         return Divider(thickness: 5, height: 10);
        //       }
        //     return CardCity();
        // })


        // ListView(
        //   children: const [
        //     CardCity(),
        //     CardCity(),
        //     CardCity(),
        //   ],
        // )

      // Form(
      //   key: _formKey,
      //   child: Container(
      //     padding: const EdgeInsets.only(left: 20, right: 20),
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           // ignore: prefer_const_constructors
      //           Text(
      //             'FELLOW4U',
      //             style: const TextStyle(fontSize: 50),
      //           ),
      //           const SizedBox(height: 30),
      //
      //           // ignore: prefer_const_constructors
      //           TextFormField(
      //             validator: (value) {
      //               if (value == null || value.isEmpty) {
      //                 return 'Please enter email!';
      //               }
      //               return null;
      //             },
      //
      //             decoration: const InputDecoration(
      //                 suffixIcon: Icon(
      //                   Icons.add_outlined,
      //                   size: 30,
      //                 ),
      //                 border: OutlineInputBorder(),
      //                 hintText: 'Email'),
      //           ),
      //           const SizedBox(height: 30),
      //
      //           TextFormField(
      //             validator: (value){
      //               if(value == null || value.isEmpty){
      //                 return 'Please enter 222312323123password 222323123132 111111111112323111111111222222221112222';
      //               }
      //               if(value.length < 6){
      //                 return 'Your password must be at lease 6 character';
      //               }
      //               return null;
      //             },
      //             obscureText: true,
      //             decoration: const InputDecoration(
      //                 suffixIcon: Icon(
      //                   Icons.add_outlined,
      //                   size: 30,
      //                 ),
      //                 border: OutlineInputBorder(),
      //                 hintText: 'Password'),
      //           ),
      //           const SizedBox(height: 30),
      //           SizedBox(
      //             width: MediaQuery.of(context).size.width,
      //             height: 50,
      //             child: OutlinedButton(
      //               child: const Text('Login with Email'),
      //               onPressed: () {
      //                 print('Login!');
      //                 if (_formKey.currentState!.validate()) {
      //                   print('FORM IS OK!!!');
      //                   //
      //                 }
      //
      //               },
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           SizedBox(
      //             width: MediaQuery.of(context).size.width,
      //             height: 50,
      //             child: OutlinedButton(
      //               child: const Text('Login with Facebook'),
      //               onPressed: () async {
      //                 print('Login with Facebook!');
      //
      //                 final LoginResult result =
      //                     await FacebookAuth.instance.login(
      //                   permissions: ['public_profile', 'email'],
      //                 );
      //
      //                 if (result.status == LoginStatus.success) {
      //                   // you are logged
      //                   print('LOGIN TOKEN!!!!');
      //                   print(result.accessToken!.token);
      //                   final userData = await FacebookAuth.i.getUserData(
      //                     fields: "name,email",
      //                   );
      //                   prettyPrint(userData);
      //                 } else {
      //                   print('YYYYY');
      //                   print(result.status);
      //
      //                   print(result.message);
      //                 }
      //               },
      //             ),
      //           ),
      //           const SizedBox(height: 30),
      //
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               IconButton(
      //                 icon: const Icon(
      //                   Icons.account_circle,
      //                   size: 50,
      //                 ),
      //                 onPressed: () {},
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 30, right: 30),
      //                 child: IconButton(
      //                   icon: const Icon(
      //                     Icons.account_circle_outlined,
      //                     size: 50,
      //                     color: Colors.red,
      //                   ),
      //                   onPressed: () {},
      //                 ),
      //               ),
      //               IconButton(
      //                 icon: const Icon(
      //                   Icons.account_circle,
      //                   size: 50,
      //                 ),
      //                 onPressed: () {},
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
