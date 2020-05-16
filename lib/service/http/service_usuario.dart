import 'dart:convert';

import 'package:app_atividade/service/interceptor/loggin_interceptor.dart';
import 'package:app_atividade/usuario_dto.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class UsarioService {

  Future<List<UsuarioDTO>> findAllUser() async {
    Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
    final Response response = await client.get('http://192.168.15.9:3000/api/usuario/find-all-user')
                                          .timeout(Duration(seconds: 15));
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return this.convertRespontoToUsuarioDTO(decodeJson);
  }

  List<UsuarioDTO> convertRespontoToUsuarioDTO(List<dynamic> decodeJson) {
    final List<UsuarioDTO> userDtoList = List();
    decodeJson.forEach((userDto) => {
      userDtoList.add(new UsuarioDTO(userDto['nome'], userDto['id']))
    });
    return userDtoList;
  }

}

