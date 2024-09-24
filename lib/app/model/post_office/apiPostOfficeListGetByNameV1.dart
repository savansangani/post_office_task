import 'dart:convert';

import 'package:post_office_task/app/services/network_service.dart';

import 'modelPostOffice.dart';

Future<ApiPostOfficeListGetByNameV1ResponseBody>
    apiPostOfficeListGetByNameV1() async {
  final response = await sendRequest.get(
    'postoffice/Vadodara',
  );

  return ApiPostOfficeListGetByNameV1ResponseBody.fromMap(
      jsonDecode(response.body));
}

class ApiPostOfficeListGetByNameV1ResponseBody {
  String message;
  String status;
  List<PostOffice> postOffices;

  ApiPostOfficeListGetByNameV1ResponseBody({
    required this.message,
    required this.status,
    required this.postOffices,
  });

  factory ApiPostOfficeListGetByNameV1ResponseBody.fromMap(
      Map<String, dynamic> map) {
    return ApiPostOfficeListGetByNameV1ResponseBody(
      message: map['Message'],
      status: map['Status'],
      postOffices: (map['PostOffice'] as List)
          .map((e) => PostOffice.fromMap(e))
          .toList(),
    );
  }
}
