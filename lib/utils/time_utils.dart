

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_util.dart';

class TimeUtils{

  static String convertMonthDateYear(String date){
    DateTime inputDate = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("MMM dd, yyyy").format(inputDate);
  }

  static String convertMonthOnly(String date){
    DateTime inputDate = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("MMM").format(inputDate);
  }
  static String convertYearOnly(String date){
    DateTime inputDate = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("yyyy").format(inputDate);
  }

  static String convertUTC(String date){
    final DateTime dateTime = DateTime.parse(date);
    String formattedDateTime = DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
    return formattedDateTime;
  }

  static String getDateComparison(DateTime currentDate, String date) {
    DateTime targetDate = DateTime.parse(date);
    if (currentDate.year == targetDate.year &&
        currentDate.month == targetDate.month &&
        currentDate.day == targetDate.day) {
      return 'Today';
    } else if (currentDate.year == targetDate.year &&
        currentDate.month == targetDate.month &&
        currentDate.day + 1 == targetDate.day) {
      return 'Tomorrow';
    } else {
      return convertUTC(targetDate.toString()); // Format: YYYY-MM-DD
    }
  }

  static String getTimeStampToDate(int timeStamp){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  static String getTimeStampToDateTime(int timeStamp){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(dateTime);
    return formattedDate;
  }

  static int getTimestamp() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch ~/ 1000;  // Unix timestamp in seconds
  }

  static String getTime12Format(String time24){
    final DateFormat inputFormat = DateFormat('HH:mm');
    final DateFormat outputFormat = DateFormat('hh:mm a');
    final DateTime parsedTime = inputFormat.parse(time24);
    final String formattedTime = outputFormat.format(parsedTime);
    return formattedTime;
  }

}