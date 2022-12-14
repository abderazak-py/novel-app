import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello/models/ad_model.dart';
import 'package:hello/screens/settings_page.dart';
import '../models/chapter_model.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key, required this.room}) : super(key: key);

  final Chapter room;

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  void initState() {
    super.initState();
    dark();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.room.name,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'changa',
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.grey[900],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: backgroundColor,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            widget.room.content,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: textColor,
                              fontFamily: fontType,
                              fontSize: readSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const AdBanner(),
            ],
          ),
        ),
      )
    ;
  }
}
