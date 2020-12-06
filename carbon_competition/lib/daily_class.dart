
class DailyData {
  int carbonUsage = 0;

  DailyData([int carbon]) {
    if (carbon != null) {
      this.carbonUsage = carbon;
    }
  }

  // add carbon to today
  void addCarbon(int carbon) {
    carbonUsage += carbon;
  }

  // print this DailyData
  void printDailyData() {
    print("Carbon Usage: $carbonUsage");
  }
}