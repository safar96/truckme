
enum Message{
  Login,
  Register,
  Error,
  Succes
}

class SuccessMessage{
  final Message message;
  final String body;

  SuccessMessage(this.message, this.body);
}