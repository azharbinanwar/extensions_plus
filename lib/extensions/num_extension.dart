extension IntExtension on num {
  // minutes int to hours, minutes string
  String toHoursMinutes() {
    final hours = this ~/ 60;
    final minutes = this % 60;
    return '${hours}h:${minutes}m';
  }
  // to hour minutes and second
  String toHourMinutesSeconds() {
    final hours = this ~/ 3600;
    final minutes = (this % 3600) ~/ 60;
    final seconds = this % 60;
    String time;
    // if hours is 0, don't show it
    // if minutes is 0, don't show it

    if (hours == 0 && minutes == 0) {
      time = '${seconds}s';
    } else if (hours == 0) {
      time = '${minutes}m:${seconds}s';
    } else {
      time = '${hours}h:${minutes}m:${seconds}s';
    }

    return time;
  }

}
