import 'package:chat_demo/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewOld extends ConsumerStatefulWidget {
  const ChatViewOld({super.key});

  @override
  ConsumerState<ChatViewOld> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatViewOld> {
  final _listViewController = ScrollController();
  final _channelFormKey = GlobalKey<FormState>();
  final _eventFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(connStateProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(state == 'DISCONNECTED' ? 'Pusher Channels Example' : ref.watch(channelNameProvider)),
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView(controller: _listViewController, scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        //     if (state != 'CONNECTED')
        //       Form(
        //           key: _channelFormKey,
        //           child: Column(children: [
        //             TextFormField(
        //               onChanged: (value) => ref.read(apiKeyProvider.notifier).state = value,
        //               validator: (String? value) {
        //                 return (value != null && value.isEmpty) ? 'Please enter your API key.' : null;
        //               },
        //               decoration: const InputDecoration(labelText: 'API Key'),
        //             ),
        //             TextFormField(
        //               onChanged: (value) => ref.read(clusterProvider.notifier).state = value,
        //               validator: (String? value) {
        //                 return (value != null && value.isEmpty) ? 'Please enter your cluster.' : null;
        //               },
        //               decoration: const InputDecoration(
        //                 labelText: 'Cluster',
        //               ),
        //             ),
        //             TextFormField(
        //               onChanged: (value) => ref.read(channelNameProvider.notifier).state = value,
        //               validator: (String? value) {
        //                 return (value != null && value.isEmpty) ? 'Please enter your channel name.' : null;
        //               },
        //               decoration: const InputDecoration(
        //                 labelText: 'Channel',
        //               ),
        //             ),
        //             ElevatedButton(
        //               onPressed: ref.read(chatCtrlProvider).onConnectPressed,
        //               child: const Text('Connect'),
        //             )
        //           ]))
        //     else
        //       Form(
        //         key: _eventFormKey,
        //         child: Column(children: <Widget>[
        //           ListView.builder(
        //               scrollDirection: Axis.vertical,
        //               shrinkWrap: true,
        //               itemCount: ref.read(chatCtrlProvider).pusher.channels[ref.read(channelNameProvider)]?.members.length,
        //               itemBuilder: (context, index) {
        //                 final member = ref
        //                     .read(chatCtrlProvider)
        //                     .pusher
        //                     .channels[ref.read(channelNameProvider)]!.members.values.elementAt(index);

        //                 return ListTile(title: Text(member.userInfo.toString()), subtitle: Text(member.userId));
        //               }),
        //           TextFormField(
        //             onChanged: (value) => ref.read(eventNameProvider.notifier).state = value,
        //             validator: (String? value) {
        //               return (value != null && value.isEmpty) ? 'Please enter your event name.' : null;
        //             },
        //             decoration: const InputDecoration(
        //               labelText: 'Event',
        //             ),
        //           ),
        //           TextFormField(
        //             onChanged: (value) => ref.read(dataProvider.notifier).state = value,
        //             decoration: const InputDecoration(
        //               labelText: 'Data',
        //             ),
        //           ),
        //           ElevatedButton(
        //             onPressed: () {
        //               var eventFormValidated = _eventFormKey.currentState!.validate();

        //               if (!eventFormValidated) {
        //                 return;
        //               }

        //               ref.read(chatCtrlProvider).onTriggerEventPressed();
        //             },
        //             child: const Text('Trigger Event'),
        //           ),
        //         ]),
        //       ),
        //     SingleChildScrollView(scrollDirection: Axis.vertical, child: Text(ref.watch(logProvider))),
        //   ]),
        // ),
      ),
    );
  }
}
