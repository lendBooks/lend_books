import 'dart:convert';
import 'dart:io';

import 'package:lend_books/data/app_exceptions.dart';
import 'package:lend_books/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkService extends BaseApiServices {
  dynamic responseJson;

  @override
  Future getApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      return responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future postApiResponse(String url, data) async {
    try {
      print(data);
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      return responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
