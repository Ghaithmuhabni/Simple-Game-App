import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("choose one"),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNum = 1;
  int rightImageNum = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNum == rightImageNum ? "Congratulations!!" : "Try again",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                child: Image.asset(
                  "images/image-$leftImageNum.png",
                ),
                onPressed: () {
                  setState(() {
                    leftImageNum = Random().nextInt(9) + 1;
                    rightImageNum = Random().nextInt(9) + 1;
                  });
                },
              )),
              Expanded(
                  child: TextButton(
                child: Image.asset("images/image-$rightImageNum.png"),
                onPressed: () {
                  setState(() {
                    rightImageNum = Random().nextInt(9) + 1;
                    leftImageNum = Random().nextInt(9) + 1;
                  });
                },
              )),
            ],
          ),
        )
      ],
    );
  }
}
