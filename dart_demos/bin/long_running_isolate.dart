import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:async/async.dart';

const filenames = [
  "assets/json_01.json",
  "assets/json_02.json",
  "assets/json_03.json"
];

void main() async {
  await for (final jsonData in _sendAndReceive(filenames)) {
    print('Received JSON with ${jsonData.length} keys');
  }
}

Stream<Map<String, dynamic>> _sendAndReceive(List<String> filenames) async* {
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJsonService, p.sendPort);

  final events = StreamQueue<dynamic>(p);

  SendPort sendPort = await events.next;

  for (var filename in filenames) {
    sendPort.send(filename);
    Map<String, dynamic> message = await events.next;
    yield message;
  }
  sendPort.send(null);
  await events.cancel();
}

Future<void> _readAndParseJsonService(SendPort p) async {
  // Send a SendPort to the main isolate so that it can send JSON strings to
  // this isolate.
  final commandPort = ReceivePort();
  p.send(commandPort.sendPort);

  // Wait for messages from the main isolate.
  await for (final message in commandPort) {
    if (message is String) {
      // Read and decode the file.
      final contents = await File(message).readAsString();

      // Send the result to the main isolate.
      p.send(jsonDecode(contents));
    } else if (message == null) {
      // Exit if the main isolate sends a null message, indicating there are no
      // more files to read and parse.
      break;
    }
  }

  print('Spawned isolate finished.');
  Isolate.exit();
}
