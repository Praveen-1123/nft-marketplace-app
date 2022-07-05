import 'dart:io';

class Connectivity {
  Future<bool> checkConnection() async {
    bool data = true;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        data = true;
      }
    } on SocketException catch (_) {
      data = false;
    }
    return data;
  }
}
