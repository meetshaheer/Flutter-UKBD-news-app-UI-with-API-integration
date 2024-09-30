import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news-api-model.dart';

List<apiModel> businessData = [];
List<apiModel> appleData = [];
List<apiModel> teslaData = [];
List<apiModel> techCrunchData = [];
List<apiModel> wallStreetData = [];

Future<List<apiModel>> getBusinessData() async {
  var url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a68ea7f819eb47d093b67111b570b654");

  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  var filterresponse = responsebody['articles'];
  businessData.clear();

  for (var eachMap in filterresponse) {
    businessData.add(apiModel.fromJson(eachMap));
  }

  return businessData;
}

Future<List<apiModel>> getAppleData() async {
  var url = Uri.parse(
      "https://newsapi.org/v2/everything?q=apple&from=2024-09-29&to=2024-09-29&sortBy=popularity&apiKey=a68ea7f819eb47d093b67111b570b654");

  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  var filterresponse = responsebody['articles'];
  appleData.clear();

  for (var eachMap in filterresponse) {
    appleData.add(apiModel.fromJson(eachMap));
  }

  return appleData;
}

Future<List<apiModel>> getTeslaData() async {
  var url = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2024-08-30&sortBy=publishedAt&apiKey=a68ea7f819eb47d093b67111b570b654");

  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  var filterresponse = responsebody['articles'];
  teslaData.clear();

  for (var eachMap in filterresponse) {
    teslaData.add(apiModel.fromJson(eachMap));
  }

  return teslaData;
}

Future<List<apiModel>> getTechCrunchData() async {
  var url =
      Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a68ea7f819eb47d093b67111b570b654");

  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  var filterresponse = responsebody['articles'];
  techCrunchData.clear();

  for (var eachMap in filterresponse) {
    techCrunchData.add(apiModel.fromJson(eachMap));
  }

  return techCrunchData;
}

Future<List<apiModel>> getWallStreetData() async {
  var url = Uri.parse("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a68ea7f819eb47d093b67111b570b654");

  var response = await http.get(url);
  var responsebody = jsonDecode(response.body);
  var filterresponse = responsebody['articles'];
  wallStreetData.clear();

  for (var eachMap in filterresponse) {
    wallStreetData.add(apiModel.fromJson(eachMap));
  }

  return wallStreetData;
}
