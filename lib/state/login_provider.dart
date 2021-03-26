import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jumpq/network/login_req.dart';

final loginProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, dynamic>>(
        (ref, userData) {
  return login(userData);
});
