import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/dio_api.dart';
import 'package:e_commerce/core/utils/logger.dart';

// class AuthRepository {
//   state signUp = { success : true, message : ""};
//   Future<void> signUp() async {

//     AuthService().signUp({'sds': "sd"});
//   }
// }

class AuthService {
  final String _endpoint = '/auth';

  Future<bool> signUp(Map<String, dynamic> data) async {
    try {
      var res = await DioInstance().post('$_endpoint/sign-up', data: data);
      return true;
      // return sendSuccessResponse(error)
    } catch (e, stacktree) {
      e as DioException;
      logger.e('${e.response}', stackTrace: stacktree);
      return false;
    }
  }

  Future<bool> signIn(Map<String, String> data) async {
    try {
      var res = await DioInstance().post('$_endpoint/sign-in', data: data);
      return res.data['success'];
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return e.response!.data['success'];
    }
  }

  Future<bool> forgotPassword(Map<String, String> data) async {
    try {
      var res = await DioInstance().post(
        '$_endpoint/forgot-password',
        data: data,
      );
      return res.data['success'];
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return e.response!.data['success'];
    }
  }

  Future<bool> resetPassword(Map<String, String> data) async {
    try {
      var res = await DioInstance().post(
        '$_endpoint/reset-password',
        data: data,
      );
      return res.data['success'];
    } on DioException catch (e, stacktree) {
      logger.e('${e.response}', stackTrace: stacktree);

      return e.response!.data['success'];
    }
  }
}
