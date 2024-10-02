import 'package:flutter/material.dart';

mixin CustomWidgets {
  // Custom TextField that helps to get properties of the task.
  Widget customTextField(BuildContext context, String hint, String label,
      TextEditingController controller, {FocusNode? focusNode}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 5.7,
      padding: const EdgeInsets.only(left: 11),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 0)),
          ]),
      child: TextField(
        autofocus: true,
        focusNode: focusNode,
        style: TextStyle(
            decoration: TextDecoration.none,
            decorationThickness: 0,
            color: Colors.black.withOpacity(0.5),
            fontSize: MediaQuery.of(context).size.width / 21,
            fontWeight: FontWeight.bold),
        controller: controller,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
            label: Text(label,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: MediaQuery.of(context).size.width / 21,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

// Custom Button to add the properties of to-do task to real-time database
}
