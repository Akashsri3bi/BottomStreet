class ApiData {
  final int ID;
  final String Security;
  final int IndustryID;
  final String Industry;
  final int SectorID;
  final String Sector;

  final double MCAP;
  final String EV;
  final String EVDateEnd;
  final double BookNavPerShare;
  final double TTMPE;
  final int TTMYearEnd;
  final double Yield;
  final String YearEnd;
  final String SectorSlug;
  final String IndustrySlug;
  final String SecuritySlug;
  final double PEGRatio;

  ApiData(
      {required this.ID,
      required this.Security,
      required this.IndustryID,
      required this.Industry,
      required this.SectorID,
      required this.Sector,
      required this.MCAP,
      required this.EV,
      required this.EVDateEnd,
      required this.BookNavPerShare,
      required this.TTMPE,
      required this.TTMYearEnd,
      required this.Yield,
      required this.YearEnd,
      required this.SectorSlug,
      required this.IndustrySlug,
      required this.SecuritySlug,
      required this.PEGRatio});
}
