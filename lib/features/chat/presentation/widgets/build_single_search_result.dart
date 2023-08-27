import 'package:flutter/material.dart';

class BuildSingleScreachResult extends StatelessWidget {
  final String name;
  final String email;
  const BuildSingleScreachResult({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Text(
            email,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
