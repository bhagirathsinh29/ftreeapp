import 'dart:io';

import 'package:flutter/material.dart';

class SecondCardWidget extends StatelessWidget {
  SecondCardWidget({
    Key? key,
    required this.labeltext,
    required this.imagePath,
  }) : super(key: key);
  final String labeltext;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 5),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 249, 151, 242), spreadRadius: 1),
            ],
          ),
          child: Container(
            child: imagePath == null || imagePath == ""
                ? Image.network(
                    'https://w7.pngwing.com/pngs/34/886/png-transparent-female-woman-girl-computer-icons-svg-face-people-logo.png')
                : Image.file(File(imagePath), fit: BoxFit.fill),
            height: 60,
            width: 60,
          ),
        ),
        SizedBox(height: 5),
        Text(labeltext, style: TextStyle(color: Colors.black.withOpacity(0.7)))
      ],
    );
  }
}
