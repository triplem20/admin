import 'package:flutter/material.dart';
class Cards extends StatelessWidget {
  const Cards({Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);


  final title;
  final icon;
  final onPress;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 50)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
      ),
      onPressed: this.onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            this.icon,
            size: 40,
          ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                this.title,
                style: TextStyle(
                fontSize: 17,
                  color: Colors.white,
                ),
                ), const SizedBox(width: 10),
                Text('18',
                  style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),)
              ],
            ),
            ]
      ),
    );
  }
}
