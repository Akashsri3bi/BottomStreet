class PerformanceItem {
  final int ID;
  final String Label;
  final String ChartPeriodCode;
  final int ChangePercent;

  PerformanceItem(
      {required this.ID,
      required this.Label,
      required this.ChartPeriodCode,
      required this.ChangePercent});

  factory PerformanceItem.fromJson(Map json) {
    return PerformanceItem(
      ID: json['ID'],
      Label: json['Label'],
      ChartPeriodCode: json['ChartPeriodCode'],
      ChangePercent: json['ChangePercent'],
    );
  }
}
