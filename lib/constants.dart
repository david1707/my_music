import 'package:flutter/material.dart';

// Fonts

const double kTitleSize = 18.0;
const double kTitleSizeBig = 26.0;
const double kSizedBoxLoginSign = 15.0;

//

final kDismissibleContainer = Container(
  color: Colors.red,
  alignment: Alignment.centerRight,
  child: Padding(
    padding: const EdgeInsets.only(right: 30.0),
    child: Icon(
      Icons.delete,
      color: Colors.white,
    ),
  ),
);
