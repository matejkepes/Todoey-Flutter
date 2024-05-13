import 'package:flutter/material.dart';

const kTaskScreenTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
);

const kTaskScreenTaskRemainingTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
);

const kTaskScreenListContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(32.0),
    topRight: Radius.circular(32.0),
  ),
);

const kAddTaskScreenContainerBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  ),
);

const kAddTaskScreenTextFieldInputDecoration = InputDecoration(
  hintText: "Enter Task Description",
  border: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xff0d47a1),
    ),
  ),
);
