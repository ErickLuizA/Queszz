import 'package:Queszz/data/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/entities/user.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/login.dart';

class LoginImpl implements Login {
  final UserRepository _userRepository;

  LoginImpl(this._userRepository);

  @override
  Future<Either<Failure, User>> execute(LoginParams params) async {
    return _userRepository.login(params);
  }
}
