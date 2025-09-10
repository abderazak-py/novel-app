import 'package:flutter/material.dart';
import '../widgets/list_item.dart';
import '../data/data.dart';

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text(
                      'قائمة الفصول',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'changa',
                        fontSize: 20,
                      ),
                    ),
                    backgroundColor: Colors.grey[900],
                  ),
                  body: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/forest2.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                ...allChapter
                                    .map((index) => ListCard(room: index))
                              ],
                            ),
                          )
                        ],
                      )),
                ));
  }
}
