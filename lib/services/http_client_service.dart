import './constants.dart';
import './api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

abstract class HttpClientService<T> {
  Future<ApiResponse<T>> get(String path, var headers) async {
    try {
      logthis("path is ",path);
      final response = await http.get(Uri.encodeFull(path), headers: headers);

      print("response of-------- " + response.body.toString());
      if (response.statusCode == 200) {
        // print("response of detail-------- "+response.body.toString());
        return SuccessApiResponse(parseToData(json.decode(response.body)),
            responseHeaders: parseHeaders(response.headers));
      } else {
        //    print(" response error is ");
        //     print("response of detail-------- "+response.body.toString());
        return ErrorApiResponse("Error occured", response.statusCode);
      }
    } catch (e) {
      print("error detail-------- ${e.toString()}");
      return ErrorApiResponse("Error occured", -1);
    }
  }

  Future<ApiResponse<T>> post(String path, var body, var headers) async {
    try {
      final response =
          await http.post(Uri.encodeFull(path), body: body, headers: headers);
      if (response.statusCode == 200) {
        logthis(" response is  asset  by add aseets ", response.body);
        return SuccessApiResponse(parseToData(json.decode(response.body)),
            responseHeaders: parseHeaders(response.headers));
      } else {
        return ErrorApiResponse("Error occured", response.statusCode);
      }
    } catch (e) {
      return ErrorApiResponse("Error occured", -1);
    }
  }

  Future<ApiResponse<T>> postt(
      String path, Map<String, String> body, var headers) async {
    print(path);
    print(body);
    try {
      final response =
          await http.post(Uri.encodeFull(path), body: body, headers: headers);
      if (response.statusCode == 200) {
        logthis(" response is  asset  by add aseets ", response.body);
        return SuccessApiResponse(parseToData(json.decode(response.body)),
            responseHeaders: parseHeaders(response.headers));
      } else {
        return ErrorApiResponse("Error occured", response.statusCode);
      }
    } catch (e) {
      return ErrorApiResponse("Error occured", -1);
    }
  }

  logthis(var message, var content) {
    print(message);
    print(content);
  }

  parseHeaders(dynamic headers) {
    return null;
  }

  T parseToData(dynamic jsonDecoded);
}
