
extension $DateTimeEx on DateTime{

  String getDateString(){
    return '$year/$month/$day';
  }

  String getTimeString(){
    return '$hour:$minute';
  }
}