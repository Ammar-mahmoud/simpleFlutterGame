import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        title: Text('the same photo'),
        backgroundColor: Colors.indigo[700],
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
  int leftImageNumber = 1;
  int rightImageNumber = 1;
  String s1 = 'try again !';
  String s2 = 'Winner Winner !';
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        leftImageNumber == rightImageNumber ? s2 : s1,
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftImageNumber = Random().nextInt(8) + 1;
                      rightImageNumber = Random().nextInt(8) + 1;
                    });
                  },
                  child: Image.asset('images/image-$leftImageNumber.png')),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightImageNumber = Random().nextInt(8) + 1;
                      leftImageNumber = Random().nextInt(8) + 1;
                    });
                  },
                  child: Image.asset('images/image-$rightImageNumber.png')),
            )
          ],
        ),
      )
    ]);
  }
}
