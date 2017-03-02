library urlParse;
import 'dart:convert';
import 'package:url_parse/url-parse.dart' show urlParse;

/**
 * parse an input git url and return a map
 */
Map<String, dynamic> gitUrlParse(String url) {
  final Map output = urlParse(url);

  final String host = output["host"];
  final String path = output["path"];

  List<String> protocols = output["protocols"];

  output["source"] = host.trim();
  output["name"] = new RegExp(r'[^\/]+(?=\.git)').stringMatch(url) ?? '';

  if (protocols.contains('git')) {
    output["owner"] = output["user"];
  }
  else {
    output["owner"] = path
      .split(new RegExp(r'\/'))
      .firstWhere((String v) => v.isNotEmpty)
      .trim();
  }
  output["full_name"] = '${output["owner"]}/${output["name"]}';

  print(new JsonEncoder.withIndent('  ').convert(output));

  return output;
}