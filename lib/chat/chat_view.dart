import 'package:chat_demo/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final _listViewController = ScrollController();
  final _channelFormKey = GlobalKey<FormState>();
  final _eventFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(connStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('User-1', style: TextStyle(fontSize: 20)),
                    const Divider(),
                    const SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            '''
                        Chat Content
                        Chat Content
                        Chat Content
                        Chat Content
                        Chat Content
                        v
                        Chat Content
                        Chat Content
                        Chat Content
                        Chat Content
                        v
                        Chat Content
                        Chat Content
                        Chat Content
                        Chat Content
                        Chat Content
                        v
                        v
                        ''',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              // onChanged: (value) => ref.read(dataProvider.notifier).state = value,
                              decoration: const InputDecoration(border: OutlineInputBorder())),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text('Send'),
                          onPressed: () => ref.read(chatCtrlProvider).connectToPusher(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
