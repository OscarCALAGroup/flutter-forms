import 'package:form_flutter/models/Users/users_mapper.dart';
import 'package:form_flutter/services/api.dart';

class UsersService {

  Future getUsers() async {
    try {
      final response = await Api.dio.get('/users');
      return UsersMapper.getList(response.data);
    } catch (e) {
      rethrow;
    }
  }
  
}
