import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

Future writeData(String key, String data) async {
  return await box.write(key, data);
}

Future<String> readData(String key) async {
  return await box.read(key);
}

Future deleteData(String key) async {
  return await box.remove(key);
}

Future deleteAllData() async {
  return await box.erase();
}
