import 'dart:typed_data';

import 'package:fast_color_picker/fast_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_painter/story_painter.dart';

import 'dart:ui' as ui;

class MenuMemo extends StatefulWidget {
  const MenuMemo({Key? key}) : super(key: key);

  @override
  MenuMemoState createState() => MenuMemoState();
}

class MenuMemoState extends State<MenuMemo> {
  StoryPainterControl painterControl = StoryPainterControl(
    type: PainterDrawType.shape,
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
    color: Colors.black,
    width: 8,
    onDrawStart: () {},
    onDrawEnd: () {},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My canvas'),
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              painterControl.undo();
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              ui.Image image = await painterControl.toImage(pixelRatio: 3.0);
              ByteData? byteData =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              var pngBytes = byteData?.buffer.asUint8List();
              if (pngBytes == null) {
                return;
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => OnlyImage(
                    imageData: pngBytes,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StoryPainter(
            control: painterControl,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Slider(
                value: painterControl.width,
                onChanged: (width) {
                  painterControl.setWidth(width);
                  setState(() {});
                },
                max: 30,
                min: 5,
              ),
              FastColorPicker(
                selectedColor: painterControl.color,
                onColorSelected: (color) {
                  painterControl.setColor(color);
                  setState(() {});
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OnlyImage extends StatelessWidget {
  final Uint8List imageData;

  const OnlyImage({Key? key, required this.imageData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image'),
      ),
      body: Image.memory(
        imageData,
      ),
    );
  }
}
