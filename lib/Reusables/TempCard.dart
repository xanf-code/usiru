import 'package:flutter/material.dart';

class BackContainer extends StatefulWidget {
  const BackContainer({
    Key key,
  }) : super(key: key);

  @override
  _BackContainerState createState() => _BackContainerState();
}

class _BackContainerState extends State<BackContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
      ),
    );
  }
}