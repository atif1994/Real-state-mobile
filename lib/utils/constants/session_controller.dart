class SessionController {
  static final SessionController _singleton = SessionController._internal();

  factory SessionController() {
    return _singleton;
  }

  SessionController._internal();

  String deviceToken = '';
  String userId = '';
}
