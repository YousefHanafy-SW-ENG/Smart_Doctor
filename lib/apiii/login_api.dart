import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://135.181.119.121:103';
  late String statusCode1;
  late String doctorCode;
  late String doctorName;

  /* dynamic login(String username, String password) async {
    var myDio = Dio();
    final response = await myDio.post(
      '$baseUrl/api/DoctorUsersLogin',
      data: {
        'username': username,
        'password': password,
      },
    );

    statusCode1=response.statusCode.toString();
    DoctorLoginModel(
      doctorcode: response.data[0]['doctorcode'],
      doctorName: response.data[0]['doctorName'],
    );

    if (response.statusCode == 200) {
      // Successful login
      //doctorCode=response.data[0]['doctorcode'].toString();
      //doctorCode=response.data[0]['doctorcode'].toString();
      // LoginModel(
      //     doctorcode: response.data[0]['doctorcode'],
      //     doctorName: response.data[0]['doctorName'],
      // );
      print(response.statusCode);
      //return (response.data);
    } else {
      print("//////////////////");
      print(response.statusCode);
      print("//////////////////");
      // Handle error
      throw Exception('Failed to login');
    }
  }*/
}
