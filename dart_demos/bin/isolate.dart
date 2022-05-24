import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Future<void> main() async {
  final filename = 'assets/json_01.json';
  final jsonData = await _spawnAndReceive(filename);
  print('Received JSON with ${jsonData.length} keys');
}
Future<Map<String, dynamic>> _spawnAndReceive(String fileName) async {
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJson, [p.sendPort, fileName]);
  return (await p.first) as Map<String, dynamic>;
}

// The entrypoint that runs on the spawned isolate. Reads the contents of
// fileName, decodes the JSON, and sends the result back the the main
// isolate.
void _readAndParseJson(List<dynamic> args) async {
  SendPort responsePort = args[0];
  String fileName = args[1];

  final fileData = await File(fileName).readAsString();
  final result = jsonDecode(fileData);
  Isolate.exit(responsePort, result);
}