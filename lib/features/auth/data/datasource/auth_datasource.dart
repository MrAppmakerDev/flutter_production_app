import 'package:dio/dio.dart';
import 'package:production_ready_flutter_app/features/auth/domain/model/user_model.dart';

class AuthDatasource {
  final Dio _dio;

  AuthDatasource(this._dio);

  Future<UserModel> loginWithGoogle(String token) async {
    var req = await _dio.post('users/login', data: {'token': token});
    return UserModel.fromJson(req.data);
  }
}
