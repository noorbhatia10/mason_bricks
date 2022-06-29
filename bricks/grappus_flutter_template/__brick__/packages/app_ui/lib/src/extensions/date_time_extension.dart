import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime? {
  String convertDateFormatToString(String dateFormat) {
    if (this == null) {
      return 'n/a';
    }

    return DateFormat(dateFormat).format(this!.toLocal());
  }

  String toDateFormatWithTimeOffset() {
    var timeOffsetVal = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(this!);
    final offset = this!.timeZoneOffset;
    final hours = offset.inHours > 0 ? offset.inHours : 1;

    if (!offset.isNegative) {
      timeOffsetVal =
          "$timeOffsetVal+${offset.inHours.toString().padLeft(2, '0')}:"
          "${(offset.inMinutes % (hours * 60)).toString().padLeft(2, '0')}";
    } else {
      timeOffsetVal =
          "$timeOffsetVal-${(-offset.inHours).toString().padLeft(2, '0')}:"
          "${(offset.inMinutes % (hours * 60)).toString().padLeft(2, '0')}";
    }
    return timeOffsetVal;
  }

  ///returns current timezone
  ///eg: +05:30
  String get currentTimeZone {
    final timeZone = StringBuffer();
    if (DateTime.now().timeZoneOffset.isNegative) {
      timeZone.write('-');
    } else {
      timeZone.write('+');
    }

    final timeZoneSplit = this!.timeZoneOffset.toString().split(':');

    final hour = int.parse(timeZoneSplit[0]);
    if (hour < 10) {
      timeZone.write('0${timeZoneSplit[0]}');
    }
    timeZone.write(':${timeZoneSplit[1]}');
    return timeZone.toString();
  }

  String timeAgo() {
    if (this == null) {
      return 'NOW';
    }
    final timeAgo = timeago.format(this!, locale: 'en_short').toUpperCase();
    return timeAgo == 'NOW' ? timeAgo : '$timeAgo AGO';
  }
}
