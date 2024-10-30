import 'package:permission_handler/permission_handler.dart';

class PermessionServices {

Future<void> checkPermissions() async {
  final status = await Permission.storage.request();
  if (status.isGranted) {
    print('Storage permission granted');
  } else if (status.isDenied) {
    print('Storage permission denied');
  } else if (status.isPermanentlyDenied) {
    print('Storage permission permanently denied');
  }
}
}
