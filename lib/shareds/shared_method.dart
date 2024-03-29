part of 'shareds.dart';

void onBoardingStatusViewed() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool status = sharedPreferences.getBool("onBoard");
  await sharedPreferences.setBool("onBoard", !status);
}

void saveSettingsTrueFalse(bool status, String name) async {
  SharedPreferences shareds = await SharedPreferences.getInstance();
  shareds.setBool(name, status);
}

String date(DateTime tm) {
  DateTime today = new DateTime.now();
  Duration oneDay = new Duration(days: 1);
  Duration twoDay = new Duration(days: 2);
  Duration oneWeek = new Duration(days: 7);
  String month;
  switch (tm.month) {
    case 1:
      month = "January";
      break;
    case 2:
      month = "February";
      break;
    case 3:
      month = "March";
      break;
    case 4:
      month = "April";
      break;
    case 5:
      month = "May";
      break;
    case 6:
      month = "June";
      break;
    case 7:
      month = "July";
      break;
    case 8:
      month = "August";
      break;
    case 9:
      month = "September";
      break;
    case 10:
      month = "October";
      break;
    case 11:
      month = "November";
      break;
    case 12:
      month = "December";
      break;
  }

  Duration difference = today.difference(tm);

  if (difference.compareTo(oneDay) < 1) {
    return "Today";
  } else if (difference.compareTo(twoDay) < 1) {
    return "Yesterday";
  } else if (difference.compareTo(oneWeek) < 1) {
    switch (tm.weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
    }
  } else if (tm.year == today.year) {
    return '${tm.day} $month';
  } else {
    return '${tm.day} $month ${tm.year}';
  }
}
