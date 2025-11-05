class ApiUrl {
  static const String base = 'https://api.github.com/users/';
  static String user(String username) => '$base$username';
  static String repos(String username) => '$base$username/repos';
}
