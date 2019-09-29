import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
