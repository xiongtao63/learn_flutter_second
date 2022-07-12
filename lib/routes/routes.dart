import 'package:learn_flutter_second/demo/basic_demo.dart';
import 'package:learn_flutter_second/demo/check_box_demo.dart';
import 'package:learn_flutter_second/demo/chip_demo.dart';
import 'package:learn_flutter_second/demo/data_table_demo.dart';
import 'package:learn_flutter_second/demo/date_time_demo.dart';
import 'package:learn_flutter_second/demo/expansion_panel_demo.dart';
import 'package:learn_flutter_second/demo/richtext_demo.dart';

import '../bottom_navigator/bottom_navigator_bar.dart';
import '../demo/alert_dialog.dart';
import '../demo/bottom_sheet_demo.dart';
import '../demo/botton_demo.dart';
import '../demo/card_demo.dart';
import '../drawer/drawer_demo.dart';
import '../tabbar/tab_bar.dart';

var routes = {
  "/tabbar": (context) => TabbarPageDemo(),
  "/bottomNavigatorBar": (context) => BottomNavigatorPageDemo(),
  "/drawer": (context) => DrawerPageDemo(),
  "/basic": (context) => BasicDemo(),
  "/richText": (context) => RichTextDemo(),
  "/alertDialog": (context) => AlertDialogDemo(),
  "/bottomSheet": (context) => BottomSheetDemo(),
  "/button": (context) => ButtonDemo(),
  "/card": (context) => CardDemo(),
  "/checkBox": (context) => CheckboxDemo(),
  "/chip": (context) => ChipDemo(),
  "/dataTable": (context) => DataTableDemo(),
  "/dateTime": (context) => DateTimeDemo(),
  "/expansionPanel": (context) => ExpansionPanelDemo(),
};
