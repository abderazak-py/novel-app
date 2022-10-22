import 'package:flutter/material.dart';
import 'package:hello/banner%20ad%20model.dart';
import 'package:hello/settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ListCard.dart';
import 'data.dart';
import 'info.dart';
import 'main.dart';

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
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
                              children: [...allChapter.map((index) => ListCard(room: index))],
                            ),
                          ),
                          const AdBanner(),
                        ],
                      )),
                )));
  }
}
