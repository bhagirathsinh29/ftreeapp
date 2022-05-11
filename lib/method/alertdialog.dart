import 'package:flutter/material.dart';
import 'package:ftreeapp/widget/genderselection.dart';
import 'package:image_picker/image_picker.dart';

class AlertDialogMethodClass {
  final ImagePicker _picker = ImagePicker();

  String? gender;
  TextEditingController textGotoValueChild = TextEditingController();

  final _formKeyChild = GlobalKey<FormState>();
  AlertDialogMethodClass({
    Key? key,
    required this.onChildAdd,
    required this.titleText,
    required this.onGenderChange,
    required this.onImagePathChanged,
  });
  ValueChanged<String> onChildAdd;
  ValueChanged<String> onGenderChange;
  ValueChanged<String> onImagePathChanged;

  final String titleText;
  showGotoAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("CANCEL"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKeyChild.currentState!.validate()) {
          if (gender == null && titleText != 'Partner') {
          } else {
            String tempChild = textGotoValueChild.text.toString();

            onChildAdd(tempChild);
            Navigator.pop(context);
          }
        } else {}
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Add $titleText",
        style: TextStyle(color: Color.fromARGB(255, 109, 185, 247)),
      ),
      content: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: titleText == 'Child' ? 320 : 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKeyChild,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: textGotoValueChild,
                    validator: (value) {
                      if (value != null && value != "") {
                        String temp = value.toString();
                        if (temp.length < 1) {
                          return "$titleText name Can't be 0";
                        } else {
                          return null;
                        }
                      } else {
                        return "$titleText name required";
                      }
                    },

                    // keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly
                    // ], // Only numbers can be entered
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: ' $titleText name'),
                  ),
                ),
              ),
              titleText == 'Child'
                  ? GenderSelection(
                      onGenderChangeWidget: (String value) {
                        gender = value;
                        onGenderChange(gender.toString());
                      },
                    )
                  : SizedBox(),
              // ignore: deprecated_member_use
              RaisedButton(
                // color: Color(0XFFFF0000),
                onPressed: () async {
                  // Pick an image

                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);

                  print(image!.path.toString());
                  onImagePathChanged(image.path.toString());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Upload image from gallary ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Icon(
                      Icons.upload_file,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              Text(
                "-------or-------",
                style: TextStyle(color: Colors.black54),
              ),
              RaisedButton(
                // color: Color(0XFFFF0000),
                onPressed: () async {
                  // Capture a photo
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.camera);
                  print(photo!.path.toString());
                  onImagePathChanged(photo.path.toString());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Open camera ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
