import 'package:flutter/material.dart';
import 'ReadPage.dart';
import 'chapters data.dart';

class ListCard extends StatelessWidget {
  final Chapter room;

  const ListCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ReadPage(room: room)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 300),
        child: Card(
          color: Colors.grey[800],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                room.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'changa',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
