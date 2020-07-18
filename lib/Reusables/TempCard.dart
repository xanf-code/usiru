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
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 25),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -6),
                blurRadius: 4,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF780206),
                Color(0xFF061161),
              ],
            ),
          ),
      ),
    );
  }
}