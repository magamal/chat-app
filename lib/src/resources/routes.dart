import 'package:get/get.dart';
import 'package:im/src/ui/feature/chat_details/chat_details_page.dart';

class Routes {
  static String getChatDetailsPage() => ChatDetailsPage.ROUTE_NAME;


  static List<GetPage> routes = [
    GetPage(name: ChatDetailsPage.ROUTE_NAME, page: () => const ChatDetailsPage()),

  ];
}