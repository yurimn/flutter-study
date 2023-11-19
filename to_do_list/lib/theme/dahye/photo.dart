import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPhoto extends StatefulWidget {
  const MenuPhoto({Key? key}) : super(key: key);
  @override
  State<MenuPhoto> createState() => _MenuPhotoState();
}

class _MenuPhotoState extends State<MenuPhoto> {
  final ImagePicker _imagePicker = ImagePicker();
  File? imageFile;
  getImageFromGallery() async {
    var imageSource = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(imageSource!.path);
    });

    // Save the image path to SharedPreferences
    if (imageFile != null) {
      saveImagePath(imageFile!.path);
    }
  }

  // Save the image path to SharedPreferences
  Future<void> saveImagePath(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('imagePath', path);
  }

  // Load the image path from SharedPreferences
  Future<String?> loadImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('imagePath');
  }

  @override
  void initState() {
    super.initState();
    // Load the image path from SharedPreferences when the widget initializes
    loadImagePath().then((path) {
      if (path != null) {
        setState(() {
          imageFile = File(path);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: GestureDetector(
                    onTap: () {
                      getImageFromGallery();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("오늘의 사진!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 20),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.7,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(248, 245, 238, 225),
                              shape: BoxShape.circle),
                          child: imageFile == null
                              ? const Icon(
                                  Icons.camera,
                                  size: 30,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ],
                    )))));
  }
}
