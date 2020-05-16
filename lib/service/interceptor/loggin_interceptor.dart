import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';

class LoggingInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('URL: ${data.url}');
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data);
    return data;
  }

}