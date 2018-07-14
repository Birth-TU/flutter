var DaysInMonth = [
  31, 29, 31,
  30, 31, 30,
  31, 31, 30,
  31, 30, 31
];

bool isLeap(Year) {
  return (Year % 4 == 0 && Year % 100 != 0) || (Year % 400 == 0);
}

class DaysMonths {
  int days;
  int months;
  DaysMonths(this.days, this.months);
}

DaysMonths getDaysAndMonths(int days) {
  int daysLeft = days;
  int thisMonth = DateTime.now().month;
  int monthsPassed = 0;
  while ( daysLeft > DaysInMonth[thisMonth] ) {
    int days = ( isLeap(DateTime.now().year) && thisMonth == 1 ) ? DaysInMonth[thisMonth] : DaysInMonth[thisMonth] - 1;
    daysLeft - days;
    thisMonth = ( thisMonth + 1 > 12 ) ? 0 : thisMonth + 1;
    monthsPassed++;
  }
  return new DaysMonths(daysLeft, monthsPassed);
}