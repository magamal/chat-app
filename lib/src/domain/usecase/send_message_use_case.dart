import 'package:im/src/domain/domain_repos/chat_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendMessageUseCase {
  final ChatRepo chatRepo;

  SendMessageUseCase(this.chatRepo);

  sendMessage(String message) async {
    chatRepo.sendMessage(message);
  }
}
