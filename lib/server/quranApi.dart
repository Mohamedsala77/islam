import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran/Model/Ahya.dart';
import 'package:quran/Model/QuranModel.dart';

class QuranServer {
  Future<List<Surah>> QuranData() async {
    final response =
        await http.get("https://api.alquran.cloud/v1/quran/quran-uthmani");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"]["surahs"];
      List<Surah> surahs = [];
      for (int i = 0; i < data.length; i++) {
        surahs.add(Surah.fromJson(data[i]));
      }
      return surahs;
    } else {
      throw Exception('Failed to load ');
    }
  }
}
