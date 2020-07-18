class Activity {
  String title;
  int points;
  String type;
  double duration;

  Activity(
    this.title,
    this.points,
    this.type,
    this.duration,
  );
}

List<Activity> activityList = [];

int points = 0;

void addActivity(Activity activity) {
  activityList.insert(0, activity);
  print(activityList);
}

void totalPoints() {
  points = 0;
  for (var i = 0; i < activityList.length; i++) {
    points = points + activityList[i].points;
  }
  print(points);
}
