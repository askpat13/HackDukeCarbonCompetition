
class DailyData {
  double carbonUsage = 0;

  DailyData([double carbon]) {
    if (carbon != null) {
      this.carbonUsage = carbon;
    }
  }

  // add carbon to today
  void addCarbon(double carbon) {
    carbonUsage += carbon;
  }

  // print this DailyData
  void printDailyData() {
    print("Carbon Usage: $carbonUsage");
  }
}