import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 1)
class Activity {
  @HiveField(0)
  String title;
  @HiveField(1)
  int points;
  @HiveField(2)
  String type;
  @HiveField(3)
  double duration;

  Activity(
    this.title,
    this.points,
    this.type,
    this.duration,
  );
}

int points = 0;
List<Activity> activityList = [];

void addActivity(Activity activity) {
  Hive.box('activity').add(activity);
}

void fillList() async {
  activityList = [];
  print(Hive.box('activity').length);
  for (var i = Hive.box('activity').length; i > 0; i--) {
    Activity activity = Activity(
      Hive.box('activity').get(i - 1).title,
      Hive.box('activity').get(i - 1).points,
      Hive.box('activity').get(i - 1).type,
      Hive.box('activity').get(i - 1).duration,
    );
    activityList.add(activity);
  }
}

void totalPoints() {
  points = 0;
  for (var i = 0; i < activityList.length; i++) {
    points = activityList[i].points + points;
  }
  print(points);
}
