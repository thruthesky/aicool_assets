import 'dart:io';
import 'package:aicool/etc/phonics/words.dart';

const String command = '''
curl https://api.openai.com/v1/audio/speech -H "Authorization: Bearer ---key---" -H "Content-Type: application/json" -d '{ "model": "tts-1-hd","input": "apple", "voice": "alloy" }' --output apple-hd.mp3
''';

void main() async {
  for (final String word in phonicsWords.keys.toList()) {
    print('word: $word, example: ${phonicsWords[word]!['example']}');

    // Will launch notepad.
    await Process.run('curl', [
      'https://api.openai.com/v1/audio/speech',
      '-H',
      "Authorization: Bearer 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",
      '-H',
      "Content-Type: application/json",
      '-d',
      '{ "model": "tts-1","input": "${phonicsWords[word]!['example']}", "voice": "alloy" }',
      '--output',
      '$word-example.mp3'
    ]);

    // final String path = 'assets/phonics/audio/$phonics.mp3';
    // final File file = File(path);
    // if (!file.existsSync()) {
    //   final String url =
    //       'https://www.oxfordlearnersdictionaries.com/media/english/uk_pron/$phonics/${phonics}__gb_1.mp3';
    //   final http.Response response = await http.get(Uri.parse(url));
    //   if (response.statusCode == 200) {
    //     await file.writeAsBytes(response.bodyBytes);
    //   }
    // }
  }
}
