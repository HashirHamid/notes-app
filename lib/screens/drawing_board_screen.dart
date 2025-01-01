// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:notes_app/configs/colors.dart';
import 'package:notes_app/widgets/app_circular_button_widget.dart';
import 'package:notes_app/widgets/tools_bottom_bar_widget.dart';
// import 'package:path_provider/path_provider.dart';

class DrawingBoardScreen extends StatefulWidget {
  const DrawingBoardScreen({super.key});

  @override
  DrawingBoardScreenState createState() => DrawingBoardScreenState();
}

class DrawingBoardScreenState extends State<DrawingBoardScreen> {
  final DrawingController _drawingController = DrawingController();
  final GlobalKey _drawingBoardKey = GlobalKey();
  late TextRecognizer textRecognizer;
  Offset offset = Offset.zero;
  String? pickedImagePath;
  String recognizedText = "";

  bool isRecognizing = false;
  final text = TextEditingController();

  @override
  void initState() {
    super.initState();

    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  }

  // void _pickImageAndProcess() async {
  //   RenderRepaintBoundary boundary = _drawingBoardKey.currentContext
  //       ?.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   File file;
  //   if (byteData != null) {
  //     Uint8List imageBytes = byteData.buffer.asUint8List();

  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath = '${directory.path}/captured_image.png';

  //     file = File(filePath);

  //     await file.writeAsBytes(imageBytes);
  //   } else {
  //     throw Exception("Failed to capture image data");
  //   }

  //   try {
  //     final inputImage = InputImage.fromFilePath(file.path);
  //     final RecognizedText recognisedText =
  //         await textRecognizer.processImage(inputImage);

  //     recognizedText = "";

  //     print("OFFSET --- ${recognisedText.blocks[0].cornerPoints}");

  //     for (TextBlock block in recognisedText.blocks) {
  //       for (TextLine line in block.lines) {
  //         recognizedText += "${line.text}\n";
  //         offset = Offset(line.boundingBox.left / 2, line.boundingBox.top);
  //       }
  //     }
  //     text.text = recognizedText;
  //   } catch (e) {
  //     if (!mounted) {
  //       return;
  //     }

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error recognizing text: $e'),
  //       ),
  //     );
  //   } finally {
  //     setState(() {
  //       isRecognizing = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: const ToolsBottomBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCircularButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        padding: 6,
                        opacity: 0.1,
                        color: AppColors.blackColor,
                        imageUrl: 'assets/icons/left-arrow.png'),
                    AppCircularButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        padding: 6,
                        opacity: 0.1,
                        color: AppColors.blackColor,
                        imageUrl: 'assets/icons/three-dots-options.png')
                  ]),
            ),
            Expanded(
              child: RepaintBoundary(
                key: _drawingBoardKey,
                child: Stack(
                  children: [
                    DrawingBoard(
                      controller: _drawingController,
                      background: Container(
                        color: AppColors.primaryColor,
                        width: 2000,
                        height: 3000,
                      ),
                    ),
                    Positioned(
                      left: offset.dx,
                      top: offset.dy,
                      child: GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              offset = Offset(offset.dx + details.delta.dx,
                                  offset.dy + details.delta.dy);
                            });
                          },
                          child: SizedBox(
                            width: 200,
                            child: TextFormField(
                                controller: text,
                                textAlign: TextAlign.center,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                )),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
