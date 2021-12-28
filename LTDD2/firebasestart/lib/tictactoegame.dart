import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class TicTacToeGame extends StatefulWidget {

  String yourChoose;

  TicTacToeGame({Key? key, required this.yourChoose}) : super(key: key);

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {

  late String square1, square2, square3 = "-";
  late String square4, square5, square6 = "-";
  late String square7, square8, square9 = "-";

  @override
  Widget build(BuildContext context) {


    final database = FirebaseDatabase.instance.reference();
    final titactoeFirebase = database.child("/tictactoe");

    titactoeFirebase.onValue.listen((event) {
      var value = event.snapshot.value;
      this.square1 = value['square1'].toString();
      this.square2 = value['square2'].toString();
      this.square3 = value['square3'].toString();
      this.square4 = value['square4'].toString();
      this.square5 = value['square5'].toString();
      this.square6 = value['square6'].toString();
      this.square7 = value['square7'].toString();
      this.square8 = value['square8'].toString();
      this.square9 = value['square9'].toString();
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('TIC TAC TOE GAME'),
      ),
      body: Center(child:
      GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square1': this.widget.yourChoose.toString()}).then((value) {
                this.square1 = this.widget.yourChoose.toString();
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square1.toString()),
              color: Colors.teal[100],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square2': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square2.toString()),
              color: Colors.teal[200],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square3': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square3.toString()),
              color: Colors.teal[300],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square4': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square4.toString()),
              color: Colors.teal[400],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square5': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(

              padding: const EdgeInsets.all(8),
              child: Text(this.square5.toString()),
              color: Colors.teal[500],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square6': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square6.toString()),
              color: Colors.teal[600],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square7': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square7.toString()),
              color: Colors.teal[100],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square8': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square8.toString()),
              color: Colors.teal[200],
            ),
          ),
          InkWell(
            onTap: () async {
              await titactoeFirebase.update({'square9': this.widget.yourChoose.toString()}).then((value) {
                setState(() {});
                print('Update xong');
              }).catchError((error) {
                print(error);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(this.square9.toString()),
              color: Colors.teal[300],
            ),
          ),
        ],
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
