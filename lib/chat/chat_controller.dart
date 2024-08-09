import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

final apiKeyProvider = StateProvider<String>((ref) => '');
final clusterProvider = StateProvider<String>((ref) => '');
final channelNameProvider = StateProvider<String>((ref) => 'my-channel');
final eventNameProvider = StateProvider<String>((ref) => 'client-event');
final dataProvider = StateProvider<String>((ref) => 'test');

final logProvider = StateProvider<String>((ref) => 'output:\n');
final connStateProvider = StateProvider<dynamic>((ref) => '');

class ChatController {
  Ref ref;
  ChatController(this.ref);

  PusherClient? pusher;
  

  void connectToPusher() async {
    log('connectToPusher', name: 'chat');

    PusherOptions options = const PusherOptions(
      host: '192.168.18.234',
      wsPort: 3131,
      encrypted: false,
      auth: PusherAuth(
        'http://192.168.18.234:8787/plugin/webman/push/auth',
        headers: {
          'Authorization': 'Bearer a38ba6d8246c28e7de573a377dd855c9',
        },
      ),
    );

    pusher = PusherClient('b1c4595f48ee3a4a4344918fdf65e8c0', options, autoConnect: false);

    pusher?.onConnectionStateChange((state) {
      log("previousState: ${state?.previousState}, currentState: ${state?.currentState}", name: 'chat');
    });

    pusher?.onConnectionError((error) {
      log("error: ${error?.message}", name: 'chat');
    });

    pusher?.connect();

    Channel channel = pusher!.subscribe("user-1");

    channel.bind("message", (PusherEvent? event) {
      log(event!.data!, name: 'chat');
    });
  }

  void disconnect() {
    log('disconnect', name: 'chat');
    pusher?.unsubscribe("private-orders");
    pusher?.disconnect();
  }
}

final chatCtrlProvider = Provider(ChatController.new);
