part of 'chat_body_container_cubit.dart';

@freezed
abstract class ChatBodyContainerStates with _$ChatBodyContainerStates {
  const factory ChatBodyContainerStates.initial() = _Initial;

  const factory ChatBodyContainerStates.loading() = _Loading;

  const factory ChatBodyContainerStates.success( List<Message> messages) = _Success;
}
