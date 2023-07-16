import 'package:flutter/material.dart';
import '../../constant/constants.dart';

Widget infoWidget({required String title, required String value}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(
          title,
          style: kDetailBodyImportantInfoTextStyle,
        ),
        Text(
          value,
          style: kDetailBodyTextStyle,
        ),
      ],
    ),
  );
}
