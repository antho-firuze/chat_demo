import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

final apiKeyProvider = StateProvider<String>((ref) => '');
final clusterProvider = StateProvider<String>((ref) => '');
final channelNameProvider = StateProvider<String>((ref) => 'my-channel');
final eventNameProvider = StateProvider<String>((ref) => 'client-event');
final dataProvider = StateProvider<String>((ref) => 'test');

final logProvider = StateProvider<String>((ref) => 'output:\n');
final connStateProvider = StateProvider<dynamic>((ref) => '');

class ChatControllerOld {
  Ref ref;
  ChatControllerOld(this.ref);

  // PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  // void onConnectPressed() async {
  //   try {

  //     await pusher.init(
  //       apiKey: 'apiKey',
  //       cluster: 'cluster',
  //       onConnectionStateChange: onConnectionStateChange,
  //       onError: onError,
  //       onSubscriptionSucceeded: onSubscriptionSucceeded,
  //       onEvent: onEvent,
  //       onSubscriptionError: onSubscriptionError,
  //       onDecryptionFailure: onDecryptionFailure,
  //       onMemberAdded: onMemberAdded,
  //       onMemberRemoved: onMemberRemoved,
  //       onSubscriptionCount: onSubscriptionCount,
  //     );
  //     await pusher.subscribe(channelName: 'channelName');
  //     await pusher.connect();
  //   } catch (e) {
  //     log('onConnectPressed | error', error: e, name: 'chat');
  //   }
  // }

  // void onConnectionStateChange(dynamic currentState, dynamic previousState) {
  //   log("Connection: $currentState");
  //   ref.read(connStateProvider.notifier).state = currentState;
  // }

  // void onError(String message, int? code, dynamic e) {
  //   log("onError: $message code: $code exception: $e");
  // }

  // void onEvent(PusherEvent event) {
  //   log("onEvent: $event");
  // }

  // void onSubscriptionSucceeded(String channelName, dynamic data) {
  //   log("onSubscriptionSucceeded: $channelName data: $data");
  //   final me = pusher.getChannel(channelName)?.me;
  //   log("Me: $me");
  // }

  // void onSubscriptionError(String message, dynamic e) {
  //   log("onSubscriptionError: $message Exception: $e");
  // }

  // void onDecryptionFailure(String event, String reason) {
  //   log("onDecryptionFailure: $event reason: $reason");
  // }

  // void onMemberAdded(String channelName, PusherMember member) {
  //   log("onMemberAdded: $channelName user: $member");
  // }

  // void onMemberRemoved(String channelName, PusherMember member) {
  //   log("onMemberRemoved: $channelName user: $member");
  // }

  // void onSubscriptionCount(String channelName, int subscriptionCount) {
  //   log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  // }

  // void onTriggerEventPressed() async {
  //   pusher.trigger(PusherEvent(
  //       channelName: ref.read(channelNameProvider),
  //       eventName: ref.read(eventNameProvider),
  //       data: ref.read(dataProvider)));
  // }

}

final chatCtrlOldProvider = Provider(ChatControllerOld.new);
