import 'package:aiyi_flutter_demo_app/demo/alert_dialog_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/bottom_sheet_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/button_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/card_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/checkbox_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/chip_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/data_table_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/date_time_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/expansion_panel_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/form_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/paginated_data_table_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/popup_menu_button_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/radio_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/simple_dialog_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/slider_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/snack_bar_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/switch_demo.dart';
import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MaterialComponents'), elevation: 2.0),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'Card', page: CardDemo()),
          ListItem(title: 'PaginatedDataTable', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTable', page: DataTableDemo()),
          ListItem(title: 'Chip', page: ChipDemo()),
          ListItem(title: 'ExpansionPanel', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBar', page: SnackBarDemo()),
          ListItem(title: 'BottomSheet', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialog', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialog', page: SimpleDialogDemo()),
          ListItem(title: 'Date & Time', page: DateTimeDemo()),
          ListItem(title: 'Slider', page: SliderDemo()),
          ListItem(title: 'Switch', page: SwitchDemo()),
          ListItem(title: 'Radio', page: RadioDemo()),
          ListItem(title: 'Checkbox', page: CheckboxDemo()),
          ListItem(title: 'Form', page: FroDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: '_WidgetDemo', page: _WidgetDemo()),
          ListItem(
              title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('_WidgetDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
            ],
          ),
        ));
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {}, icon: Icon(Icons.add), label: Text('add'));

  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
//    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FloatingActionButtonDemo'), elevation: 2.0),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
