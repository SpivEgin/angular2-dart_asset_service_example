import 'dart:async';
import 'dart:math';
import 'package:lorem/lorem.dart';
import 'package:angular2/core.dart';
import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';

@Injectable()
class PlaceholderContentService implements ContentService {
  static const int maxDelay = 1500; //max simulated delay in milliseconds
  final Random _rnd = new Random();
  final Lorem lorem = new Lorem();

  @override
  Future<String> getContent(String id) async {
    final String content = await new Future<String>.delayed(
        new Duration(milliseconds: _rnd.nextInt(maxDelay)), () =>
        _generateSampleContent());
    return content;
  }

  String _generateSampleContent() {
    final StringBuffer sb = new StringBuffer();
    do {
      sb.write(_rndSection(minPars: 2, maxPars: 5));
    } while (_rnd.nextDouble() < 0.65);

    return sb.toString();
  }

  String _rndSection({int headerLength: 5, int minPars: 2, int maxPars: 5}) {
    final StringBuffer sb = new StringBuffer();
    sb.writeln(
        "<h2>${lorem.createSentence(sentenceLength: headerLength)}</h2>");
    sb.writeln("<p>${lorem.createParagraph(
        numSentences: minPars + _rnd.nextInt(maxPars - minPars))}</p>");
    return sb.toString();
  }

}
