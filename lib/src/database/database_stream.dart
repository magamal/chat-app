import 'dart:async';

class DataBaseStream {
  final streamController = StreamController<DataBaseEvent>();

  StreamSubscription<DataBaseEvent> listenOnDataBaseStream(
      Function(DataBaseEvent) listener) {
    return streamController.stream.listen(listener);
  }

}

sealed class DataBaseEvent {}

class MessageSavedInDataBase extends DataBaseEvent {}
