part of 'im_app_bar_cubit.dart';

@freezed
abstract class ImAppBarState with _$ImAppBarState {
  const factory ImAppBarState.initial() = _Initial;

  const factory ImAppBarState.numberOfMessagesChanged(int numberOfMessages) =
      _NumberOfMessagesChanged;
}

