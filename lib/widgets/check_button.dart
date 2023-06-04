import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import '../Screens/message.dart';

class CheckButton extends StatelessWidget {
  final dynamic uploadImageToFirebase;
  final dynamic image;

  const CheckButton({super.key,
    required this.uploadImageToFirebase,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonSize = screenSize.width * 0.15;

    return Container(
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        color: ColorsPalette.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: IconButton(
        color: Colors.white,
        icon: const Icon(Icons.check),
        iconSize: buttonSize * 0.7,
        onPressed: () {
          uploadImageToFirebase(image).then((result) {
            if (result is String?) {
              // Image uploaded successfully
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LastPage()),
              );
            } else {
              // Handle error uploading image
            }
          });
        },
      ),
    );
  }
}
