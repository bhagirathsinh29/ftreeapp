// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ftreeapp/method/alertdialog.dart';
import 'package:ftreeapp/widget/maincard_widget.dart';
import 'package:ftreeapp/widget/secondcard_widget.dart';

import 'package:graphview/GraphView.dart';

class TestingGraph extends StatefulWidget {
  @override
  _TreeViewFromJsonState createState() => _TreeViewFromJsonState();
}

class _TreeViewFromJsonState extends State<TestingGraph> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    edgesList = edgejson['edges']!;
    edgesList.forEach((element) {
      Object? fromNodeId = element['from'];
      Object? toNodeId = element['to'];
      graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId));
    });

    builder
      ..siblingSeparation = (40)
      ..levelSeparation = (100)
      ..subtreeSeparation = (30)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  String? gender;

  String? imagePath;
  List<Map<String, Object>> edgesList = [];
  List<Map<String, Object>> nodesList = [];
  Map<String, List<Map<String, Object>>> nodesjson = {
    'nodes': [
      // {'id': 0, 'label': 'Tree'},
      {
        'id': 'Grandpaa',
        'label': 'Grandpaa',
        'partner': 'Grandmaa',
        'gender': 'male'
      },
      // {
      //   'id': 'Graandmaa',
      //   'label': 'Graandmaa',
      //   'partner': '',
      //   'gender': 'female'
      // },
      {'id': 'Uncle', 'label': 'Uncle', 'gender': 'male'},
    ],
  };

  Map<String, List<Map<String, Object>>> edgejson = {
    'edges': [
      {'from': 'Grandpaa', 'to': 'Uncle'},
    ]
  };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

///////////////////////////<~~~~~~Ignore~~~~~~>////////////////////////////////////////
    Path path = Path();
    path.moveTo(
        0, //Ax,
        size.width / 2); // Ay

    path.quadraticBezierTo(
        size.width / 15, //Bx,
        size.height / 6, //By,

        size.width / 2, //Cx,
        size.height / 4); //Cy

    path.quadraticBezierTo(
        size.height / 2, //Dx,
        size.width / 1.5, //Dy,

        size.width, //Ex,
        size.width / 2); // Ey

///////////////////////////////////////////////////////////////////

    return Scaffold(
        appBar: AppBar(
          title: Text("Json family tree"),
        ),
        body: Container(
          color: Colors.blue.withOpacity(0.2),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text("Family Tree", style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(50),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: GraphView(
                    graph: graph,
                    algorithm: BuchheimWalkerAlgorithm(
                        builder, TreeEdgeRenderer(builder)),
                    paint: paint,
                    builder: (Node node) {
                      // I can decide what widget should be sshown here based on the id
                      String? stringId = node.key!.value;
                      nodesList = nodesjson['nodes']!;
                      Map<String, Object> nodeValue = nodesList
                          .firstWhere((element) => element['id'] == stringId);

                      return rectangleWidget(
                          nodeValue['label'] as String,
                          nodeValue['partner'] as String,
                          nodeValue['gender'] as String,
                          nodeValue['imagePath'] as String,
                          nodeValue['partnerimagePath'] as String);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget rectangleWidget(String? labelText, String? partnerString,
      String genderType, String imagePath, String partnerimagePath) {
    return GestureDetector(
      onDoubleTap: () {
        print('hiiii');
      },
      onTap: () {
        genderType == 'male'
            ? AlertDialogMethodClass(
                onChildAdd: (String value) {
                  print('~~~~~~~~~~~nodesjson>$nodesjson~~~~~~~~~');
                  if (partnerString == '' || partnerString == null) {
                    int index = (nodesjson['nodes'] as List)
                        .indexWhere((element) => element['id'] == labelText);

                    (nodesjson['nodes'] as List)[index]['partner'] = value;

                    (nodesjson['nodes'] as List)[index]['partnerimagePath'] =
                        imagePath;
                  } else {
                    (nodesjson['nodes'] as List).add({
                      'id': '$value',
                      'label': '$value',
                      'partner': null,
                      'gender': gender,
                      'imagePath': imagePath
                    });
                    graph.addEdge(Node.Id(labelText), Node.Id(value));
                  }

                  print('~~~~~~~~~~~~nodesjson>$nodesjson~~~~~~~~~~');
                  setState(() {});
                },
                titleText: partnerString == '' || partnerString == null
                    ? 'Partner'
                    : 'Child',
                onGenderChange: (String value) {
                  print('~~~~~~~~~~~~~~before setState~~>$gender~~~~~~~~~~~~');
                  gender = value;
                  setState(() {});
                  ;
                  print('~~~~~~~~~~~~~~after setState~~>$gender~~~~~~~~~~~~');
                },
                onImagePathChanged: (String value) {
                  imagePath = value;

                  setState(() {});
                },
              ).showGotoAlert(
                context,
              )
            : null;
      },
      child: Row(
        children: [
          MainCardWidget(
            imagePath: imagePath,
            genderType: genderType,
            labelText: labelText.toString(),
          ),
          SizedBox(width: 10),
          partnerString == '' || partnerString == null
              ? SizedBox()
              : SecondCardWidget(
                  labeltext: partnerString.toString(),
                  imagePath: partnerimagePath,
                )
        ],
      ),
    );
  }
}
