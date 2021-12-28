// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebasestart/tictactoegame.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  var price = "01";
  var description = "This is Desc";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final database = FirebaseDatabase.instance.reference();



  @override
  Widget build(BuildContext context) {
    //dailySpecial
    final dailySpecialRef = database.child("/dailySpecial");

    dailySpecialRef.onValue.listen((event) {
      var value = event.snapshot.value;
      this.widget.description = value['description'].toString();
      this.widget.price = value['price'].toString();
      setState(() {});
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          Container(
              child: InkWell(
                  onTap: () async {
                    await dailySpecialRef.onValue.listen((event) {
                      var value = event.snapshot.value;
                      setState(() {
                        this.widget.description =
                            value['description'].toString();
                        this.widget.price = value['price'].toString();
                        print(this.widget.description);
                        print(this.widget.price);
                      });
                    });
                  },
                  child: Text('Read Text'))),
          Text('Price'),
          Text(this.widget.price),
          Text('Description'),
          Text(this.widget.description),
          OutlinedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  TicTacToeGame(yourChoose: "X",)),
            );
          }, child: Text('TicTacToe : X')),
          OutlinedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  TicTacToeGame(yourChoose: "O",)),
            );
          }, child: Text('TicTacToe : O'))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print('Click here');

            Random random = new Random();
            int randomNumber = random.nextInt(1000);
            await dailySpecialRef
                .set({'description': 'TEST-' + randomNumber.toString(), 'price': randomNumber.toString()}).then((value) {
              setState(() {});
              print('Update xong');
            }).catchError((error) {
              print(error);
            });

            print('Click here END');
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }


}
