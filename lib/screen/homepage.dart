import 'package:flutter/material.dart';
import 'package:ftreeapp/screen/testinggraph.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestingGraph(),
                    ),
                  ),
              child: Text(
                "testing graph tree",
                style: TextStyle(fontSize: 30),
              )),
        ],
      ),
    );
  }
}
