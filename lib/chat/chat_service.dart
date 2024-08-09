import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatService {
  Ref ref;
  ChatService(this.ref);
}

final chatSvcProvider = Provider(ChatService.new);
