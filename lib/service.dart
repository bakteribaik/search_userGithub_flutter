import 'dart:convert';

import 'package:belajar_list_2/model.dart';
import 'package:http/http.dart' as http;

class DataService{
  Future<Github> fetchData(String input) async {

    final url = 'https://api.github.com/search/users?q=$input';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    return Github.fromJson(data);
  }
}

