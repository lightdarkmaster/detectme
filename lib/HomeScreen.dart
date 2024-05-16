import 'package:detectme/AboutUs.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_pytorch/pigeon.dart';
import 'package:flutter_pytorch/flutter_pytorch.dart';
import 'package:detectme/LoaderState.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ModelObjectDetection _objectModel;
  String? _imagePrediction;
  List? _prediction;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool objectDetection = false;
  List<ResultObjectDetection?> objDetect = [];
  bool firststate = false;
  bool message = true;
  bool isCardExpanded = false;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    String pathObjectDetectionModel = "assets/models/yolov5s.torchscript";
    try {
      _objectModel = await FlutterPytorch.loadObjectDetectionModel(
          // change the 80 with number of classes in your model pretrained yolov5 had almost 80 classes so I added 80 here.
          pathObjectDetectionModel,
          80,
          640,
          640,
          labelPath: "assets/labels/labels.txt");
    } catch (e) {
      if (e is PlatformException) {
        print("only supported for android, Error is $e");
      } else {
        print("Error is $e");
      }
    }
  }

  void handleTimeout() {
    // callback function
    // Do some work.
    setState(() {
      firststate = true;
    });
  }

  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  // running detections on image
  Future runObjectDetection() async {
    setState(() {
      firststate = false;
      message = false;
    });
    // pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    objDetect = await _objectModel.getImagePrediction(
        await File(image!.path).readAsBytes(),
        minimumScore: 0.1,
        IOUThershold: 0.3);
    for (var element in objDetect) {
      print({
        "score": element?.score,
        "className": element?.className,
        "class": element?.classIndex,
        "rect": {
          "left": element?.rect.left,
          "top": element?.rect.top,
          "width": element?.rect.width,
          "height": element?.rect.height,
          "right": element?.rect.right,
          "bottom": element?.rect.bottom,
        },
      });
    }
    scheduleTimeout(5 * 1000);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 121, 112),
        title: const Text(
          "Detect Me",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 194, 215, 225),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: isCardExpanded
                    ? null
                    : 500, // Set the desired height or null if expanded
                width: 400, // Set the desired width
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 8,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image with Detections
                        !firststate
                            ? !message
                                ? const LoaderState()
                                : const Text(
                                    "Select the Camera to Begin Detections")
                            : SizedBox(
                                height: 300, // Adjust the height as needed
                                width: 300, // Adjust the width as needed
                                child: _objectModel.renderBoxesOnImage(
                                    _image!, objDetect),
                              ),
                        Center(
                          child: Visibility(
                            visible: _imagePrediction != null,
                            child: Text("$_imagePrediction"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            runObjectDetection();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                const Size(150, 50), // Set width and height
                            backgroundColor:
                                const Color.fromARGB(255, 255, 121, 112),
                          ),
                          child: const Icon(Icons.camera_alt),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isCardExpanded
                    ? null
                    : 300, // Set the desired height or null if expanded
                width: 400, // Set the desired width
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 8,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Detected Objects:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: objDetect.length,
                            itemBuilder: (context, index) {
                              final detection = objDetect[index];
                              return detection == null
                                  ? const SizedBox.shrink()
                                  : Text(
                                      "${detection.className} (Score: ${(detection.score * 100).toStringAsFixed(2)}%)",
                                      style: const TextStyle(fontSize: 16),
                                    );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isCardExpanded = !isCardExpanded;
                              });
                            },
                            child: Text(
                                isCardExpanded ? "Show Less" : "Show More"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
