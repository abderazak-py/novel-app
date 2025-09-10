import 'package:flutter/material.dart';

class SelectPageCard extends StatelessWidget {
  const SelectPageCard(
      {Key? key, required this.text, required this.icon, required this.toPage})
      : super(key: key);
  final String text;
  final IconData icon;
  final Widget toPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return toPage;
          },
        ),
      ),
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListTile(
                title: Center(
                    child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontFamily: 'changa',
                    fontWeight: FontWeight.w700,
                  ),
                )),
                trailing: Icon(
                  icon,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
