// lib/data/user_session.dart

class UserSession {
  static int userId = 0;
  static String name = "";
  static String email = "";

  static bool get isLogin => userId != 0;

  static void setUser({
    required int id,
    required String userName,
    required String userEmail,
  }) {
    userId = id;
    name = userName;
    email = userEmail;
  }

  static void clear() {
    userId = 0;
    name = "";
    email = "";
  }
}