class Const {
  //server api
  static const apiURL = String.fromEnvironment('API_URL', defaultValue: 'https://dummyjson.com');
  static int connectionTimeout = 30000;
}
