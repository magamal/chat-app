import 'package:injectable/injectable.dart';

@injectable
class TestDatabaseProcessor {
  Future saveMessage() async {
    print("Started: saveMessage");
    await Future.delayed(Duration(seconds: 1));
    print("Finished: saveMessage");
    return "Message Saves success in database";
  }

  Future updateDataBase() async {
    print("Started: updateDataBase");
    await Future.delayed(Duration(seconds: 1));
    print("Finished: updateDataBase");
    return "updated success in database";
  }

}
