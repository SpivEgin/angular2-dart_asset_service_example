import 'dart:async';
import 'package:angular2/core.dart';

abstract class ContentService {
   Future<String> getContent(String id);
}
