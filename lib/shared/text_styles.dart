import 'package:flutter/material.dart';
import 'package:jala/shared/colors.dart';

TextStyle textBlack(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: blackColor);

TextStyle textWhite(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: whiteColor);

TextStyle textPrimary(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: primaryColor);

TextStyle textPrimaryDark(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: primaryDarkColor);

TextStyle textGray(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: grayColor);

TextStyle textGrayish(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: grayishColor);

TextStyle textUnselected(
        {double fontSize = 14, FontWeight weight = FontWeight.w400}) =>
    TextStyle(fontSize: fontSize, fontWeight: weight, color: unselectedColor);
