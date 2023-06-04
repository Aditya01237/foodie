import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';

class MealImage extends StatelessWidget {
  final File? image;

  const MealImage({super.key, this.image, required double width, required double height});

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
      radius: 100,
      backgroundImage: FileImage(image!),
      backgroundColor: ColorsPalette.secondaryColor,
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fork.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Stack(
            alignment: AlignmentDirectional.center,
          children:  <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsPalette.cornerColor,
                  width: 4,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsPalette.bgColor,
                  width: 20,
                ),
              ),
              child: const CircleAvatar(
                radius: 100,
                backgroundColor: ColorsPalette.secondaryColor,
              ),
            ),
          ]
        ),
        Container(
          width: 50,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/spoon.png'),
              fit: BoxFit.contain,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
