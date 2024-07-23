import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRevision {
  static const revisionKey = "revision";

  final instance = GetIt.I.get<SharedPreferences>();

  get revision => instance.getInt(revisionKey) ?? 0;

  set(int value) async => await instance.setInt(revisionKey, value);
}
