import 'dart:convert';

import 'package:bottomstreet/performanceitem.dart';

import 'data.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  final String baseURl1 =
      "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en";
  final String baseURl2 =
      "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en";
  static Future<ApiData> getResponse() async {
    Uri uri = Uri.parse(ApiCall().baseURl1);

    final response = await http.get(uri);
    final decode = json.decode(response.body) as Map<String, dynamic>;

    return ApiData(
      ID: decode['ID'],
      Security: decode['Security'],
      IndustryID: decode['IndustryID'],
      Industry: decode['Industry'],
      SectorID: decode['SectorID'],
      Sector: decode['Sector'],
      MCAP: decode['MCAP'],
      EV: decode['EV'].toString(),
      EVDateEnd: decode['EVDateEnd'].toString(),
      BookNavPerShare: decode['BookNavPerShare'],
      TTMPE: decode['TTMPE'],
      TTMYearEnd: decode['TTMYearEnd'],
      Yield: decode['Yield'],
      YearEnd: decode['YearEnd'].toString(),
      SectorSlug: decode['SectorSlug'],
      IndustrySlug: decode['IndustrySlug'],
      SecuritySlug: decode['SecuritySlug'],
      PEGRatio: decode['PEGRatio'],
    );
  }

  static Future<List<PerformanceItem>> getList() async {
    Uri uri = Uri.parse(ApiCall().baseURl2);

    final response = await http.get(uri);
    List performances = json.decode(response.body);
    return performances.map((e) => PerformanceItem.fromJson(e as Map)).toList();
  }
}
