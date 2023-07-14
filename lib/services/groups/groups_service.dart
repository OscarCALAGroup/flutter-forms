import 'package:form_flutter/models/Groups/groups_mapper.dart';
import 'package:form_flutter/services/api.dart';

class GroupsService {

  Future getGroups() async {
    try {
      final response = await Api.dio.get('/groups');
      
      return GroupsMapper.getList(response.data);
    } catch (e) {
      rethrow;
    }
  }
  
}