import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../utils/colors.dart';
import '../widgets/camera_button.dart';
import '../widgets/check_button.dart';
import '../widgets/meal_image.dart';
import '../widgets/meal_prompts.dart';
import '../models/notification_manager.dart';

class ShareMealPage extends StatefulWidget {
  const ShareMealPage({Key? key}) : super(key: key);

  @override
  _ShareMealPageState createState() => _ShareMealPageState();
}

class _ShareMealPageState extends State<ShareMealPage> {
  File? _image;
  final picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();
      // print('Image uploaded successfully. URL: $imageUrl');
      // calling the notification
      NotificationManager.showNotification();
      return imageUrl;
    } catch (e) {
      // print('Error uploading image to Firebase storage: $e');
      return null;
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxWidth = screenSize.width;
    final maxHeight = screenSize.height;

    final smallSpacing;

    print("height is " + "${maxHeight}");

    if(maxHeight < 810)
      {
        smallSpacing = maxHeight * 0.001;
      }
    else
      {
        smallSpacing = maxHeight * 0.02;
      }
    final imageWidth = maxWidth * 0.8;
    final imageHeight = maxHeight * 0.45;

    final buttonSize = maxWidth * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Expanded(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: maxWidth,
                  height: imageHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/elephant.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: buttonSize,
                  width: buttonSize,
                  margin: const EdgeInsets.only(bottom: 350, left: 20),
                  decoration: BoxDecoration(
                    color: ColorsPalette.primaryColor,
                    borderRadius: BorderRadius.circular(buttonSize / 2),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back),
                    iconSize: buttonSize * 0.7,
                    onPressed: () {
                      if (_image == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyApp()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ShareMealPage()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: maxWidth,
                height: maxHeight - imageHeight,
                decoration: const BoxDecoration(
                  color: ColorsPalette.bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                  children: [
                    SizedBox(height: smallSpacing),
                    MealImage(image: _image, width: imageWidth, height: imageHeight),
                    SizedBox(height: smallSpacing),
                    if (_image == null)
                      Text(
                        MealPrompts.clickMealPrompt,
                        style: MealPrompts.getPromptTextStyle(context),
                      ),
                    if (_image != null)
                      Text(
                        MealPrompts.confirmMealPrompt,
                        style: MealPrompts.getPromptTextStyle(context),
                      ),
                    SizedBox(height: smallSpacing),
                    if (_image == null)
                      CameraButton(pickImageFromCamera: _pickImageFromCamera),
                    if (_image != null)
                      CheckButton(
                        uploadImageToFirebase: uploadImageToFirebase,
                        image: _image!,
                      ),
                  ],
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
