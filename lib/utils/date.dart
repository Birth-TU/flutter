const DaysInMonth = [
  31, 29, 31,
  30, 31, 30,
  31, 31, 30,
  31, 30, 31
];

bool isLeap(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

class DaysMonths {
  int days;
  int months;
  DaysMonths(this.days, this.months);
}

int getYear() {
  int year = DateTime.now().year;
  return ( DateTime.now().isAfter(DateTime( year, DateTime.MARCH , 21, 00, 45))) ? year + 1 : year;
}

DaysMonths getDaysAndMonths(int days) {
  int daysLeft = days;
  int thisMonth = DateTime.now().month;
  int monthsPassed = 0;
  while ( daysLeft > DaysInMonth[thisMonth] ) {
    int days = ( isLeap(DateTime.now().year) && thisMonth == 1 ) ? DaysInMonth[thisMonth] : DaysInMonth[thisMonth];
    thisMonth = ( thisMonth + 1 >= 12 ) ? 0 : thisMonth + 1;
    daysLeft = daysLeft - days;
    monthsPassed++;
  }
  return new DaysMonths(daysLeft, monthsPassed);
}