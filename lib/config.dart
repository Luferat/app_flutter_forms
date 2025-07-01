final class Config {

  static const String appName = "Hello World";
  static const String apiBaseURL = "http://localhost:8080";
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)*$',
  );
  static const Map<String, String> endpoint = {
    'contact': '$apiBaseURL/contact',
    'books': '$apiBaseURL/books',
  };

}