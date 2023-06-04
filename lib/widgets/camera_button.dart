import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';

class CameraButton extends StatelessWidget {
  final Function() pickImageFromCamera;

  const CameraButton({required this.pickImageFromCamera});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final buttonSize = constraints.maxWidth * 0.15;

        return Container(
          height: buttonSize,
          width: buttonSize,
          decoration: BoxDecoration(
            color: ColorsPalette.primaryColor,
            borderRadius: BorderRadius.circular(buttonSize / 2),
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
            icon: const Icon(Icons.camera_alt),
            iconSize: buttonSize * 0.7,
            onPressed: pickImageFromCamera,
          ),
        );
      },
    );
  }
}
