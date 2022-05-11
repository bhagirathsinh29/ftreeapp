import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final GlobalKey _widgetKey = GlobalKey();

  String tempvar = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              key: _widgetKey,
              height: 50,
              width: 50,
              color: Colors.red,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowWidget(),
                SizedBox(
                  width: 10,
                ),
                rowWidget()
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            _getWidgetInfo();
            // AlertDialogMethodClass(
            //   onChildAdd: (String value) {
            //     setState(() {
            //       tempvar = value;
            //       print('~~~~~~~~~~~~~~~~$tempvar~~~~~~~~~~~~~');
            //     });
            //     // print('~~~~~~~~~~~nodesjson>$nodesjson~~~~~~~~~');
            //     // if (partnerString == '' || partnerString == null) {
            //     //   int index = (nodesjson['nodes'] as List)
            //     //       .indexWhere((element) => element['id'] == labelText);
            //     //   (nodesjson['nodes'] as List)[index]['partner'] = value;
            //     //   // (nodesjson['nodes'] as List)[index]['gender'] = gender;
            //     // } else {
            //     //   (nodesjson['nodes'] as List).add({
            //     //     'id': '$value',
            //     //     'label': '$value',
            //     //     'partner': null,
            //     //     'gender': gender
            //     //   });
            //     //   graph.addEdge(Node.Id(labelText), Node.Id(value));
            //     // }

            //     // print('~~~~~~~~~~~~nodesjson>$nodesjson~~~~~~~~~~');
            //     // setState(() {});
            //   },
            //   titleText:
            //       // partnerString == '' || partnerString == null
            //       //     ? 'Partner'
            //       //     :
            //       'Child',
            //   onGenderChange: (String value) {
            //     // print('~~~~~~~~~~~~~~before setState~~>$gender~~~~~~~~~~~~');
            //     // gender = value;
            //     // setState(() {});
            //     // ;
            //     // print('~~~~~~~~~~~~~~after setState~~>$gender~~~~~~~~~~~~');
            //   },
            //   genderpassed: '',
            //   // genderpassed: genderType,
            // ).showGotoAlert(
            //   context,
            // );
          }),
        ));
  }

  Row rowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 80,
          width: 80,
          color: Colors.blue,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 80,
          width: 80,
          color: Colors.pink,
        ),
      ],
    );
  }

  void _getWidgetInfo() {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    print('Size: ~~~~~~~~~~~~~~~${size.width}, ${size.height}~~~~~~~~~~~~~~~');

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    print('Offset: ~~~~~~~~~~~~~${offset.dx}, ${offset.dy}~~~~~~~~~~~~~~~~~');
    print(
        'Position: ~~~~~~~~~~~~${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}~~~~~~~~~~~~~~');
  }
}
