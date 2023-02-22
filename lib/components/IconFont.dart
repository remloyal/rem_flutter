// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

class IconFont {
  static const String _family = 'iconfont';
  IconFont._();
  static const IconData fcm_biaoqing = IconData(0xe63e, fontFamily: _family);
  static const IconData fcm_gaoqing = IconData(0xe641, fontFamily: _family);
  static const IconData fcm_zanting = IconData(0xe618, fontFamily: _family);
  static const IconData fcm_bofang = IconData(0xe87c, fontFamily: _family);
  static const IconData fcm_quanping_tc = IconData(0xe697, fontFamily: _family);
  static const IconData fcm_quanping = IconData(0xe6d9, fontFamily: _family);
  static const IconData fcm_jingyin_x = IconData(0xeb5e, fontFamily: _family);
  static const IconData fcm_jingyin_m = IconData(0xeb5f, fontFamily: _family);
  static const IconData fcm_map_road = IconData(0xe70e, fontFamily: _family);
  static const IconData fcm_marker = IconData(0xe62e, fontFamily: _family);
  static const IconData fcm_danwei_x = IconData(0xe675, fontFamily: _family);
  static const IconData fcm_ray_on = IconData(0xe65a, fontFamily: _family);
  static const IconData fcm_ray_off = IconData(0xe65b, fontFamily: _family);
  static const IconData fcm_ray_auto = IconData(0xe65e, fontFamily: _family);
  static const IconData fcm_light = IconData(0xe609, fontFamily: _family);
  static const IconData fcm_info = IconData(0xe617, fontFamily: _family);
  static const IconData fcm_ques = IconData(0xe632, fontFamily: _family);
  static const IconData fcm_time_along = IconData(0xe806, fontFamily: _family);
  static const IconData fcm_time_hand = IconData(0xe6c5, fontFamily: _family);
  static const IconData fcm_time_off = IconData(0xe707, fontFamily: _family);
  static const IconData fcm_end = IconData(0xe6ca, fontFamily: _family);
  static const IconData fcm_time_back = IconData(0xe66a, fontFamily: _family);
  static const IconData fcm_time_end = IconData(0xe897, fontFamily: _family);
  static const IconData fcm_time_start = IconData(0xe997, fontFamily: _family);
  static const IconData fcm_date = IconData(0xe605, fontFamily: _family);
  static const IconData fcm_rili = IconData(0xe6a1, fontFamily: _family);
  static const IconData fcm_change = IconData(0xe62d, fontFamily: _family);
  static const IconData fcm_danwei = IconData(0xe62c, fontFamily: _family);
  static const IconData fcm_shebie = IconData(0xe640, fontFamily: _family);
  static const IconData fcm_alarm_ts = IconData(0xe6d1, fontFamily: _family);
  static const IconData fcm_alarm_msg = IconData(0xe69e, fontFamily: _family);
  static const IconData fcm_alarm_tx = IconData(0xe6e5, fontFamily: _family);
  static const IconData fcm_weizhi = IconData(0xe60b, fontFamily: _family);
  static const IconData fcm_duigouxiao = IconData(0xe8bd, fontFamily: _family);
  static const IconData fcm_stop = IconData(0xe6bd, fontFamily: _family);
  static const IconData fcm_yiguoqi_yiyuqi_01 =
      IconData(0xe884, fontFamily: _family);
  static const IconData fcm_backtop = IconData(0xe66d, fontFamily: _family);
  static const IconData fcm_xiala = IconData(0xe65d, fontFamily: _family);
  static const IconData fcm_worklog = IconData(0xe606, fontFamily: _family);
  static const IconData fcm_search = IconData(0xe63d, fontFamily: _family);
  static const IconData fcm_dingwei = IconData(0xec32, fontFamily: _family);
  static const IconData fcm_mark = IconData(0xe62b, fontFamily: _family);
  static const IconData fcm_play = IconData(0xe65c, fontFamily: _family);
  static const IconData fcm_allread = IconData(0xe6c7, fontFamily: _family);
  static const IconData fcm_clear = IconData(0xe80b, fontFamily: _family);
  static const IconData fcm_contacts = IconData(0xe7de, fontFamily: _family);
  static const IconData fcm_alarm_wxp = IconData(0xe69d, fontFamily: _family);
  static const IconData fcm_alarm_gj = IconData(0xe6d3, fontFamily: _family);
  static const IconData fcm_nav_alarm = IconData(0xe638, fontFamily: _family);
  static const IconData fcm_nav_xj = IconData(0xe656, fontFamily: _family);
  static const IconData fcm_nav_xj1 = IconData(0xe6c4, fontFamily: _family);
  static const IconData fcm_nav_home = IconData(0xe613, fontFamily: _family);
  static const IconData fcm_nav_my = IconData(0xe6df, fontFamily: _family);
  static const IconData fcm_help = IconData(0xe65f, fontFamily: _family);
  static const IconData fcm_newspaper = IconData(0xe8ae, fontFamily: _family);
  static const IconData fcm_guanbi = IconData(0xe634, fontFamily: _family);
  static const IconData fcm_set = IconData(0xe62a, fontFamily: _family);
  static const IconData fcm_book = IconData(0xe63a, fontFamily: _family);
  static const IconData fcm_screen = IconData(0xe628, fontFamily: _family);
  static const IconData fcm_alarm_fx = IconData(0xe627, fontFamily: _family);
  static const IconData fcm_path = IconData(0xe626, fontFamily: _family);
  static const IconData fcm_shangbao = IconData(0xe625, fontFamily: _family);
  static const IconData fcm_saoma = IconData(0xe623, fontFamily: _family);
  static const IconData fcm_alarm_gz = IconData(0xe612, fontFamily: _family);
  static const IconData fcm_alarm_yh = IconData(0xe637, fontFamily: _family);
  static const IconData fcm_fire = IconData(0xe66c, fontFamily: _family);
  static const IconData fcm_nav_shebei = IconData(0xe603, fontFamily: _family);
  static const IconData fcm_scan = IconData(0xe62f, fontFamily: _family);
  static const IconData fcm_msg = IconData(0xe8be, fontFamily: _family);
  static const IconData fcm_phone = IconData(0xe600, fontFamily: _family);
  static const IconData fcm_yzm = IconData(0xe624, fontFamily: _family);
}

void setIcon = (String name) {
  const String family = 'iconfont';
  final String iconName = '0xe$name';
  return IconData(
    int.parse(iconName),
    fontFamily: family,
  );
};
