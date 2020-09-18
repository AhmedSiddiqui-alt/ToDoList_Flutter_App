import 'package:flutter/material.dart';

class EmptyTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 150),
          // height: 0,
          // width: 290,
          child: Image.asset(
            'assets/images/WhatTodo.png',
            fit: BoxFit.cover,
          )),
    );
  }
}
