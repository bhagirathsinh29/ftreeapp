import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

class ArrowScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ArrowScreen> {
  bool showArrows = true;

  @override
  Widget build(BuildContext context) => ArrowContainer(
        child: Scaffold(
          appBar: AppBar(
            title: ArrowElement(
              show: showArrows,
              color: Colors.red,
              id: 'title',
              targetId: 'text2',
              targetAnchor: Alignment.topCenter,
              sourceAnchor: Alignment.bottomCenter,
              child: Container(
                  height: 30,
                  color: Colors.purple,
                  child: Text('Arrows everywhere')),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ArrowElement(
                  show: showArrows,
                  id: 'text',
                  targetIds: ['fab', 'title'],
                  sourceAnchor: Alignment.bottomCenter,
                  color: Colors.green,
                  child: Container(
                      color: Colors.pink,
                      height: 30,
                      width: 200,
                      child: Center(child: Text('Arrows and stuff'))),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ArrowElement(
                    show: showArrows,
                    id: 'text2',
                    targetId: 'text',
                    targetAnchor: Alignment.centerRight,
                    child: Container(
                      color: Colors.pink,
                      height: 40,
                      child: Text(
                        'Arrow here please',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: ArrowElement(
            id: 'fab',
            child: FloatingActionButton(
              onPressed: () => setState(() {
                showArrows = !showArrows;
              }),
              tooltip: 'hide/show',
              child: Icon(Icons.remove_red_eye),
            ),
          ),
        ),
      );
}
