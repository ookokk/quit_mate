class MyNotification {
  String title = "";
  String message = "";

  MyNotification({required this.title, required this.message});

  String getLocalizedMessage() {
    return message;
  }
}
