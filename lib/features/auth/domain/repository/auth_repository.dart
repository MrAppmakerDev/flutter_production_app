import 'package:production_ready_flutter_app/core/failure/failure.dart';
import 'package:production_ready_flutter_app/core/model/either.dart';
import 'package:production_ready_flutter_app/features/auth/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> loginWithGoogle();
}
