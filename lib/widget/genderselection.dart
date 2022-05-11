// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({Key? key, required this.onGenderChangeWidget});
  ValueChanged<String> onGenderChangeWidget;

  @override
  State<GenderSelection> createState() => _HomeState();
}

class _HomeState extends State<GenderSelection> {
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Radio(
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                    widget.onGenderChangeWidget(gender.toString());
                  }),
              Text("Male"),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                    widget.onGenderChangeWidget(gender.toString());
                  }),
              Text("Female"),
            ],
          ),
        ],
      ),
    );
  }
}
