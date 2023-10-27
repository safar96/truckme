import '../auth/success_message.dart';
import 'user_info.dart';

class SuccessMessageUser{
  final Message message;
  final String body;
  final UserInfo userInfo;

  SuccessMessageUser(this.message, this.body, this.userInfo);
}