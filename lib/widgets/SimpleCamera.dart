import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class SimpleCamera extends StatefulWidget {
  final CameraDescription camera;
  final String petName;

  const SimpleCamera({super.key, required this.camera, required this.petName});

  @override
  State<StatefulWidget> createState() => _SimpleCameraState();
}

class _SimpleCameraState extends State<SimpleCamera> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.camera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: CameraPreview(controller!),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    try {
                      final path = join(
                        // Store the picture in the temp directory.
                        // Find the temp directory using the `path_provider` plugin.
                        (await getApplicationDocumentsDirectory()).path,
                        '${widget.petName}.png',
                      );

                      print("save file to $path");

                      final picture = await controller.takePicture();

                      await picture.saveTo(path);

                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Take Photo")),
              // if (imagePath != "")
              //   Container(
              //       width: 300,
              //       height: 300,
              //       child: Image.file(
              //         File(imagePath),
              //       ))
            ],
          ),
        ),
      ),
    );
  }
}
