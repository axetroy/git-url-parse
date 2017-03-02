import 'package:test/test.dart';

import '../lib/git-url-parse.dart' show gitUrlParse;

@TestOn('linux || mac-os || posix || content-shell || window')
void main() {
  group('Test http proto > ', () {
    test("Parse an https url.", () {
      String url = 'https://github.com/gpmer/gpm.js.git';
      final Map<String, dynamic> result = gitUrlParse(url);
      expect(result["source"], equals('github.com'));
      expect(result["owner"], equals('gpmer'));
      expect(result["name"], equals('gpm.js'));
      expect(result.keys.length, equals(15));
    });
  });

  group('Test git proto > ', () {
    test('parse git url', () {
      String url = 'git@github.com:gpmer/gpm.js.git';
      final Map<String, dynamic> result = gitUrlParse(url);
      expect(result["source"], equals('github.com'));
      expect(result["owner"], equals('gpmer'));
      expect(result["name"], equals('gpm.js'));
      expect(result["full_name"], equals('gpmer/gpm.js'));
      expect(result.keys.length, equals(15));
    });
  });

  group('Test mix proto > ', () {
    test('parse git url', () {
      String url = 'https+git@github.com:gpmer/gpm.js.git';
      final Map<String, dynamic> result = gitUrlParse(url);
      expect(result["source"], equals('github.com'));
      expect(result["owner"], equals('gpmer'));
      expect(result["name"], equals('gpm.js'));
      expect(result.keys.length, equals(15));
    });
  });
}