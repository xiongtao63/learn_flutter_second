import 'package:learn_flutter_second/demo/animation_demo.dart';
import 'package:learn_flutter_second/demo/basic_demo.dart';
import 'package:learn_flutter_second/demo/bloc_demo.dart';
import 'package:learn_flutter_second/demo/check_box_demo.dart';
import 'package:learn_flutter_second/demo/chip_demo.dart';
import 'package:learn_flutter_second/demo/data_table_demo.dart';
import 'package:learn_flutter_second/demo/date_time_demo.dart';
import 'package:learn_flutter_second/demo/expansion_panel_demo.dart';
import 'package:learn_flutter_second/demo/float_action_button_demo.dart';
import 'package:learn_flutter_second/demo/future_demo.dart';
import 'package:learn_flutter_second/demo/http_demo.dart';
import 'package:learn_flutter_second/demo/opacity_demo.dart';
import 'package:learn_flutter_second/demo/pageview_demo.dart';
import 'package:learn_flutter_second/demo/paginated_data_table_demo.dart';
import 'package:learn_flutter_second/demo/richtext_demo.dart';
import 'package:learn_flutter_second/demo/simple_dialog_demo.dart';
import 'package:learn_flutter_second/demo/slider_demo.dart';
import 'package:learn_flutter_second/demo/snack_bar_demo.dart';
import 'package:learn_flutter_second/demo/state_manager_demo.dart';
import 'package:learn_flutter_second/demo/stepper_demo.dart';
import 'package:learn_flutter_second/demo/switch_demo.dart';
import 'package:learn_flutter_second/demo/view_demo.dart';
import 'package:learn_flutter_second/demo/wrap_demo.dart';
import 'package:learn_flutter_second/provider/change_notifier_provider_demo.dart';
import 'package:learn_flutter_second/provider/index.dart';
import 'package:learn_flutter_second/provider/provider_demo.dart';

import '../bottom_navigator/bottom_navigator_bar.dart';
import '../comsumer/InheritedContext_demo.dart';
import '../comsumer/consumer_demo.dart';
import '../comsumer/index.dart';
import '../comsumer/provider_of_demo.dart';
import '../comsumer/selector_demo.dart';
import '../demo/alert_dialog.dart';
import '../demo/bottom_sheet_demo.dart';
import '../demo/botton_demo.dart';
import '../demo/card_demo.dart';
import '../demo/form_demo.dart';
import '../demo/keep_alive.dart';
import '../demo/layout_demo.dart';
import '../demo/listview_demo.dart';
import '../demo/localizations_demo.dart';
import '../demo/pop_menu_button_demo.dart';
import '../demo/radio_demo.dart';
import '../demo/rxdart_demo.dart';
import '../demo/sliver_demo.dart';
import '../demo/stream_demo.dart';
import '../demo/text_field_demo.dart';
import '../drawer/drawer_demo.dart';
import '../provider/change_notifier_proxy_provider_demo.dart';
import '../provider/future_provider_demo.dart';
import '../provider/multi_provider_demo.dart';
import '../provider/proxy_provider_demo.dart';
import '../provider/stream_provider_demo.dart';
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
  "/floatButton": (context) => FloatingActionButtonDemo(),
  "/formDemo": (context) => FormDemo(),
  "/textField": (context) => TextFieldDemo(),
  "/layout": (context) => LayoutDemo(),
  "/listview": (context) => ListViewDemo(),
  "/pageinatedDataTable": (context) => PaginatedDataTableDemo(),
  "/popupMenuButton": (context) => PopupMenuButtonDemo(),
  "/radio": (context) => RadioDemo(),
  "/simpleDialog": (context) => SimpleDialogDemo(),
  "/slider": (context) => SliderDemo(),
  "/sliver": (context) => SliverDemo(),
  "/snackBar": (context) => SnackBarDemo(),
  "/stepper": (context) => StepperDemo(),
  "/switch": (context) => SwitchDemo(),
  "/girdView": (context) => ViewDemo(),
  "/pageView": (context) => PageViewBuilderDemo(),
  "/animation": (context) => AnimationDemo(),
  "/bloc": (context) => BlocDemo(),
  "/http": (context) => HttpDemo(),
  "/http": (context) => HttpDemo(),
  "/locale": (context) => I18nDemo(),
  "/rxdart": (context) => RxDartDemo(),
  "/state": (context) => StateManagementDemo(),
  "/stream": (context) => StreamDemo(),
  "/keepAliveAndTopBar": (context) => KeepAlivePage(),
  "/wrap": (context) => WrapDemo(),
  "/opacity": (context) => OpacityDemo(),
  "/future": (context) => FutureDemo(),
  "/provider": (context) => ProviderIndexPage(),
  "/providerDemo": (context) => ProviderDemo(),
  "/changeNotifierProviderDemo": (context) => ChangeNotifierProviderDemo(),
  "/futureProviderDemo": (context) => FutureProviderDemo(),
  "/streamProviderDemo": (context) => StreamProviderDemo(),
  "/multiProviderDemo": (context) => MultiProviderDemo(),
  "/proxyProviderDemo": (context) => ProxyProviderDemo(),
  "/changeNotifierProxyProviderDemo": (context) => ChangeNotifierProxyProviderDemo(),
  "/consumer": (context) => ConsumerIndexPage(),
  "/providerOfDemo": (context) => ProviderOfDemo(),
  "/consumerDemo": (context) => ConsumerDemo(),
  "/selectorDemo": (context) => SelectorDemo(),
  "/inheritedContextDemo": (context) => InheritedContextDemo(),
};
