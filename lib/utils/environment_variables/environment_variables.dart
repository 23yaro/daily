abstract class EnvironmentVariables {
  static const token = String.fromEnvironment('TOKEN');

  static const host = String.fromEnvironment('HOST');

  static const baseUrl = String.fromEnvironment('BASEURL');

  static const appVersion =
      String.fromEnvironment('APP_VERSION', defaultValue: 'PROD');
}
