import 'dart:async';

abstract class ContentService {
 Future<String> getContent(String id);
}
