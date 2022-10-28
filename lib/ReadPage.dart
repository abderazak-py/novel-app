import 'package:flutter/material.dart';
import 'package:hello/banner%20ad%20model.dart';
import 'package:hello/settings.dart';
import 'chapters data.dart';

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
            title: const Text(
              'صفحة القراءة',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'changa',
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.grey[900],
          ),
          body: Column(
            children: [
              Container(
                color: backgroundColor,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.room.name,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'changa',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: backgroundColor,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                    child: SingleChildScrollView(
                      child: Text(
                        widget.room.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: textColor,
                          fontFamily: fontType,
                          fontSize: readSize,
                        ),
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
