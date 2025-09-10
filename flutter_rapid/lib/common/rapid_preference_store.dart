import 'package:fr_core/fr_core.dart';
import 'package:get_storage/get_storage.dart';

class RapidPreferenceStore extends RapidService {
  late GetStorage _storage;

  Future<RapidPreferenceStore> init() async {
    await GetStorage.init();
    _storage = GetStorage();
    return this;
  }

  Future<void> save(String key, value) async {
    await _storage.write(key, value);
  }

  bool hasData(String key) {
    return _storage.hasData(key);
  }

  T read<T>(String key) {
    return _storage.read(key);
  }

  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  Future<void> clear() async {
    await _storage.erase();
  }
}