import 'package:flutter/material.dart';

class BodyScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget subtitle;

  const BodyScaffold({
    Key key,
    @required this.title,
    @required this.child,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Column(
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                this.subtitle,
              ],
            ),
            background: Image.asset(
              "assets/map-01.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverFillRemaining(
          child: this.child,
        )
      ],
    );
  }
}
