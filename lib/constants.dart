import 'package:flutter/material.dart';

InputDecoration kInputTextDecoration = InputDecoration(
    hintText: 'Input Email',
    hintStyle: const TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.circular(24),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.circular(24),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blueAccent,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(24),
    ));

