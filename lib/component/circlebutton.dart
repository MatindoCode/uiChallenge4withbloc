import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Text? operation;
  final Color? buttonColor;
  final Color? secondButtonColor;
  final VoidCallback? onPressed;

  const CircleButton( {super.key, required this.operation, this.buttonColor, this.secondButtonColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed
        // Handle button press
      ,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, backgroundColor: Colors.transparent, // Remove default padding for gradient alignment
        shape: const CircleBorder(), // Make the background transparent to show gradient
        elevation: 0, // Optional: Set elevation to 0 if you want a flat appearance
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              colors: [
              buttonColor ?? Colors.white, // Fallback to white if buttonColor is null
              secondButtonColor ?? const Color.fromARGB(255, 169, 219, 245), // Default gradient
            ],
          ),
          shape: BoxShape.circle, // Ensure the gradient matches the circular shape
        ),
        child: Container(
          width: screenWidth/5, // Set button size
          height: screenHeight/9, // Set button size
          alignment: Alignment.center,
          child: operation
          ),
        ),
      );
  }
}