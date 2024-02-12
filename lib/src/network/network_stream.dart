import 'dart:async';


class NetworkStream {
  final streamController = StreamController<NetworkEvent>();

  StreamSubscription<NetworkEvent> listenOnDataBaseStream(
      Function(NetworkEvent) listener) {
    return streamController.stream.listen(listener);
  }
}

sealed class NetworkEvent {}

class MessageSentSuccess extends NetworkEvent {}
