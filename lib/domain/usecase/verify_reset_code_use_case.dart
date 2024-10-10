import 'package:online_exam100/core/api_resault/api_resault.dart';
import 'package:online_exam100/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class VerifyResetCodeUseCase
{
  final AuthRepository authRepository;
  VerifyResetCodeUseCase({required this.authRepository});


  Future<Result<String?>>invoke({required String resetCode}){
    return authRepository.verifyResetCode(resetCode: resetCode);
  }
}