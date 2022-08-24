import 'package:http/http.dart';

class HistoryW {
  double WeekBalance;
  double MonthBalance;
  double LastMonthBalance;
  String uid;
  HistoryW(
    this.WeekBalance,
    this.LastMonthBalance,
    this.MonthBalance,
    this.uid,
  );
}
