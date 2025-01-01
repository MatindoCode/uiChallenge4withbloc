import 'package:flutter/material.dart';

class Horizonbutton extends StatelessWidget {
  final Text? operation;
  final VoidCallback? onPressed;

  const Horizonbutton( {super.key, required this.operation, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, backgroundColor: Colors.transparent, // Remove default padding for gradient alignment
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(20),)), // Make the background transparent to show gradient
        elevation: 0, // Optional: Set elevation to 0 if you want a flat appearance
       
      ),
      
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 169, 219, 245)],
          ),
         borderRadius: BorderRadius.circular(15.0),// Ensure the gradient matches the circular shape
        ),
      child: Container(
         width: screenWidth/6, // Set button size
          height: screenHeight/20, 
          alignment: Alignment.center,
        child: operation
      ),
      ),
    );
  }
}