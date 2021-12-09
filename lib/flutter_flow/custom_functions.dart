import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool authentiacate(
  String email,
  String password,
) {
  if (email == 'perkowskikrzysio@gmail.com' && password == 'test') {
    return true;
  }
  return false;
}

String formatAuthor(String author) {
  return "by " + author;
}
