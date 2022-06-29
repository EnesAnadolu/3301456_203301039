class DayItem {
  int x; //weekday
  double y; //app usage time

  DayItem({required this.x, required this.y}); //usage

  static DayItem fromJson(Map<String, dynamic> json) {
    return DayItem(x: json['x'], y: json['y']);
  }

  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }
}