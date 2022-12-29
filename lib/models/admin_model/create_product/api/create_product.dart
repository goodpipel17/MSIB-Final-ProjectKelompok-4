import 'dart:convert';

import 'package:final_project_kel_4/models/admin_model/create_product/create_model.dart';
import 'package:final_project_kel_4/models/register_model/register_model.dart';
import 'package:http/http.dart' as http;

class CreatProductApi {
  Future<String> postprodcts(CreateOfProductModel createproduct) async {
    var url = Uri.parse("https://aki.nurulfikri.com/api/admin/barang");

    var response = await http.post(url, body: createproduct.toJson());
    if (response.statusCode == 200) {
      return json.decode(response.body)['info'];
    }
    return throw json.decode(response.body)['info'];
  }
}
