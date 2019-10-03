import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool inner;

  const LoadingIndicator({Key key, this.inner = false}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      inner
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
