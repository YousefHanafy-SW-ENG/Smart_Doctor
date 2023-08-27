import 'package:flutter/material.dart';

void appDialog(Widget dialog, BuildContext context) => showDialog(
      context: context,
      builder: (context) => Dialog(
        child: dialog,
      ),
    );
