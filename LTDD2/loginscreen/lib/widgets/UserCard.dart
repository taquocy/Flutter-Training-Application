// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserCard extends StatefulWidget {


  var isFavorite = false;


  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.center,
      children: [
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
              setState(() {
                this.widget.isFavorite = !this.widget.isFavorite;
              });

            },
            child: const SizedBox(
              width: 150,
              height: 150,
              child: Center(child: Text('Ho Chi Minh City')),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          left: 100,
          child: Align(
              alignment: Alignment.bottomCenter,

              child: widget.isFavorite == false ? const Icon(Icons.favorite_border) : const Icon(Icons.favorite)
          ),
        ),
      ],
    );
  }
}
