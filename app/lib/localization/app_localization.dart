import 'package:get/get.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'msg_mkulimatv':'Mkulima TV',
          'msg_hellow': 'Hellow',
          'msg_good': 'Good',
        },
        'sw_IN': {
          'msg_mkulimatv':'Mkulima Runinga',
          'msg_hellow': 'Habareee',
          'msg_good': 'Vizuri',
        }
      };
}
