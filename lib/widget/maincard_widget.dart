import 'dart:io';

import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  MainCardWidget(
      {Key? key,
      required this.genderType,
      required this.labelText,
      required this.imagePath})
      : super(key: key);
  String genderType;
  String labelText;
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 5),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                  color: genderType == 'male'
                      ? Color.fromARGB(255, 141, 165, 206)
                      : Color.fromARGB(255, 249, 151, 242),
                  spreadRadius: 1),
            ],
          ),
          child: Container(
            child: imagePath == null || imagePath == ""
                ? Image.network(genderType == 'male'
                    ? 'https://e7.pngegg.com/pngimages/894/494/png-clipart-black-male-symbol-art-avatar-education-professor-user-profile-faculty-boss-face-heroes-thumbnail.png'
                    : 'https://w7.pngwing.com/pngs/34/886/png-transparent-female-woman-girl-computer-icons-svg-face-people-logo.png')
                : Image.file(File(imagePath), fit: BoxFit.fill),

            height: 60,
            width: 60,
            // decoration: BoxDecoration(
            //   // color: Colors.white,
            //   image: DecorationImage(
            //       image: NetworkImage(
            //         genderType == 'male'
            //             ? 'https://e7.pngegg.com/pngimages/894/494/png-clipart-black-male-symbol-art-avatar-education-professor-user-profile-faculty-boss-face-heroes-thumbnail.png'
            //             : 'https://w7.pngwing.com/pngs/34/886/png-transparent-female-woman-girl-computer-icons-svg-face-people-logo.png',
            //       ),
            //       fit: BoxFit.fill),
            // ),
          ),
        ),
        SizedBox(height: 5),
        Text('$labelText',
            style: TextStyle(color: Colors.black.withOpacity(0.7))),
      ],
    );
  }
}
